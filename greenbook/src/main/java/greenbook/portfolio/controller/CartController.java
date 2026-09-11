package greenbook.portfolio.controller;


import greenbook.portfolio.domain.*;
import greenbook.portfolio.service.BookService;
import greenbook.portfolio.service.CartService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.math.BigInteger;
import java.text.SimpleDateFormat;
import java.util.*;

@RestController
@RequestMapping("/api")
public class CartController {

    @Autowired
    CartService cartService;

    @Autowired
    BookService bookService;

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

    @PostMapping("/update")
    public ResponseEntity<String> updateCart(
            @RequestBody CartDto cart,
            HttpSession session) {

        try {

            MemberDto member =
                    (MemberDto) session.getAttribute("user");

            if (member == null) {
                return ResponseEntity
                        .status(HttpStatus.UNAUTHORIZED)
                        .body("FAIL");
            }

            String userId =
                    member.getMe_id();

            int amount =
                    cart.getCa_amount();

            RegistrationDto dbRegi =
                    bookService.getRegiBook(
                            cart.getCa_re_code()
                    );

            if (dbRegi == null) {
                return ResponseEntity
                        .badRequest()
                        .body("FAIL");
            }

            cart.setCa_me_id(userId);


            String result;


            // 요청 수량이 재고보다 많을 경우
            if (amount > dbRegi.getRe_amount()) {

                cart.setCa_amount(
                        dbRegi.getRe_amount()
                );

                result = "OK1";

            }

            // 요청 수량이 재고 이하일 경우
            else {

                cart.setCa_amount(amount);

                result = "OK2";
            }


            cartService.updateCart(cart);


            return ResponseEntity.ok(result);


        } catch (Exception e) {

            e.printStackTrace();

            return ResponseEntity
                    .status(HttpStatus.INTERNAL_SERVER_ERROR)
                    .body("FAIL");
        }
    }

    @PostMapping("/inicis")
    public ResponseEntity<String> payInicis(
            OrderDto order,
            ShippingDto shipping,
            @RequestParam String apply_num,
            @RequestParam String pay_method,
            @RequestParam String paid_at,
            @RequestParam String imp_uid,
            HttpSession session) {

        try {

            MemberDto member =
                    (MemberDto) session.getAttribute("user");

            if (member == null) {
                return ResponseEntity
                        .status(HttpStatus.UNAUTHORIZED)
                        .body("0");
            }

            if (!member.getMe_id().equals(order.getOr_me_id())) {
                return ResponseEntity
                        .status(HttpStatus.FORBIDDEN)
                        .body("0");
            }

            String me_name =
                    member.getMe_name();

            cartService.insertShipping(shipping);

            order.setOr_sh_num(
                    shipping.getSh_num()
            );

            cartService.insertPayFinished(order);

            cartService.updateOrderState(
                    order.getOr_num()
            );

            long timestamp =
                    Long.parseLong(paid_at);

            Date date =
                    new Date(timestamp * 1000L);

            SimpleDateFormat sdf =
                    new SimpleDateFormat(
                            "yyyy-MM-dd HH:mm:ss"
                    );

            sdf.setTimeZone(
                    TimeZone.getTimeZone("GMT+9")
            );

            String formattedDate =
                    sdf.format(date);

            cartService.insertPaymentInic(
                    apply_num,
                    pay_method,
                    me_name,
                    order.getOr_num(),
                    formattedDate,
                    imp_uid
            );

            return ResponseEntity.ok(
                    order.getOr_num()
            );

        } catch (Exception e) {

            e.printStackTrace();

            return ResponseEntity
                    .status(HttpStatus.INTERNAL_SERVER_ERROR)
                    .body("0");
        }
    }

}
