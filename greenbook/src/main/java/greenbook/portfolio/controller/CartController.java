package greenbook.portfolio.controller;


import greenbook.portfolio.domain.CartDto;
import greenbook.portfolio.domain.MemberDto;
import greenbook.portfolio.service.CartService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.math.BigInteger;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/api")
public class CartController {

    @Autowired
    CartService cartService;

    @GetMapping("/cart")
    public ResponseEntity<Map<String, Object>> cart(HttpSession session) {

        MemberDto user = (MemberDto) session.getAttribute("user");

        if (user == null) {
            return new ResponseEntity<>(HttpStatus.UNAUTHORIZED);
        }

        List<CartDto> cartList = cartService.getCartList(user);

        Map<String, Object> result = new HashMap<>();
        result.put("cartList", cartList);

        return ResponseEntity.ok(result);
    }

    @PostMapping("/cart")
    public ResponseEntity<String> cart(@RequestBody CartDto cart, HttpSession session) {

        try {
            MemberDto user = (MemberDto) session.getAttribute("user");

            if(user == null)
                throw new Exception("CART FAILED");

            cart.setCa_me_id(user.getMe_id());
            cartService.addCart(cart);

            return new ResponseEntity<>("CART_OK", HttpStatus.OK);

        } catch (Exception e) {

            e.printStackTrace();
            return new ResponseEntity<>("CART_ERR", HttpStatus.BAD_REQUEST);

        }
    }

    @PostMapping("/cartRegister")
    public ResponseEntity<String> cartList(
            BigInteger[] checkList,
            Integer[] cartAmount,
            HttpSession session) {

        try {
            MemberDto user =
                    (MemberDto) session.getAttribute("user");

            if (user == null) {
                return new ResponseEntity<>(
                        "CART_ERR",
                        HttpStatus.UNAUTHORIZED
                );
            }

            cartService.getCartRegister(
                    checkList,
                    cartAmount,
                    user.getMe_id()
            );

            return new ResponseEntity<>(
                    "CART_OK",
                    HttpStatus.OK
            );

        } catch (Exception e) {
            e.printStackTrace();

            return new ResponseEntity<>(
                    "CART_ERR",
                    HttpStatus.BAD_REQUEST
            );
        }
    }

    @GetMapping("/payment")
    public ResponseEntity<Map<String, Object>> getPayment(
            HttpSession session,
            Integer[] ca_num,
            BigInteger isbn,
            Integer amount) {

        try {
            MemberDto member = (MemberDto) session.getAttribute("user");


            System.out.println("member = " + member);
            System.out.println("ca_num = " + Arrays.toString(ca_num));
            System.out.println("isbn = " + isbn);
            System.out.println("amount = " + amount);

            if (member == null) {
                return new ResponseEntity<>(HttpStatus.UNAUTHORIZED);
            }

            List<CartDto> paymentList;

            if (ca_num != null && ca_num.length != 0) {
                paymentList = cartService.getPaymentList(ca_num, member);
            } else {
                paymentList = cartService.getPaymentList(isbn, amount);
            }

            Map<String, Object> result = new HashMap<>();
            result.put("paymentList", paymentList);
            result.put("member", member);

            return ResponseEntity.ok(result);

        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
        }
    }

}
