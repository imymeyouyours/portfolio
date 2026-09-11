package greenbook.portfolio.controller;


import greenbook.portfolio.domain.*;
import greenbook.portfolio.service.BookService;
import greenbook.portfolio.service.CartService;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.*;
import java.math.BigInteger;
import java.net.HttpURLConnection;
import java.net.URL;
import java.nio.charset.StandardCharsets;
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

    @Value("${kakao.secret.key}")
    private String kakaoSecretKey;

    @PostMapping("/kakaopay")
    public ResponseEntity<String> kakaopay(
            HttpSession session,
            OrderDto order,
            ShippingDto shipping) {

        try {

            // 1. 로그인 확인
            MemberDto member =
                    (MemberDto) session.getAttribute("user");

            if (member == null) {
                return ResponseEntity
                        .status(HttpStatus.UNAUTHORIZED)
                        .body("{\"result\":\"NO\"}");
            }

            // 2. 주문 회원과 로그인 회원 확인
            if (!member.getMe_id().equals(order.getOr_me_id())) {
                return ResponseEntity
                        .status(HttpStatus.FORBIDDEN)
                        .body("{\"result\":\"NO\"}");
            }


            // =========================
            // 배송지 저장
            // =========================

            cartService.insertShipping(shipping);

            System.out.println(
                    "shipping sh_num = " + shipping.getSh_num()
            );

            order.setOr_sh_num(shipping.getSh_num());


            // =========================
            // 주문 저장
            // =========================

            cartService.insertPayFinished(order);

            System.out.println(
                    "order or_num = " + order.getOr_num()
            );


            // =========================
            // 카카오페이 Ready API
            // =========================

            URL url = new URL(
                    "https://open-api.kakaopay.com/online/v1/payment/ready"
            );

            HttpURLConnection connection =
                    (HttpURLConnection) url.openConnection();

            connection.setRequestMethod("POST");

            connection.setRequestProperty(
                    "Authorization",
                    "SECRET_KEY " + kakaoSecretKey.trim()
            );

            connection.setRequestProperty(
                    "Content-Type",
                    "application/json;charset=UTF-8"
            );

            connection.setRequestProperty(
                    "Accept",
                    "application/json"
            );

            connection.setDoOutput(true);


            // =========================
            // 요청 JSON
            // =========================

            JSONObject requestJson = new JSONObject();

            requestJson.put(
                    "cid",
                    "TC0ONETIME"
            );

            requestJson.put(
                    "partner_order_id",
                    String.valueOf(order.getOr_num())
            );

            requestJson.put(
                    "partner_user_id",
                    member.getMe_id()
            );

            requestJson.put(
                    "item_name",
                    "GreenBookStore"
            );

            requestJson.put(
                    "quantity",
                    1
            );

            requestJson.put(
                    "total_amount",
                    order.getOr_payment()
            );

            requestJson.put(
                    "tax_free_amount",
                    0
            );


            // =========================
            // Redirect URL
            // =========================

            String approvalUrl =
                    "http://localhost:8080/greenbook/payfinished"
                            + "?partner_order_id="
                            + order.getOr_num();

            String cancelUrl =
                    "http://localhost:8080/greenbook/payment";

            String failUrl =
                    "http://localhost:8080/greenbook/payment";


            requestJson.put(
                    "approval_url",
                    approvalUrl
            );

            requestJson.put(
                    "cancel_url",
                    cancelUrl
            );

            requestJson.put(
                    "fail_url",
                    failUrl
            );


            System.out.println(
                    "Kakao request = " + requestJson.toJSONString()
            );


            // =========================
            // 카카오페이로 전송
            // =========================

            try (
                    OutputStream os =
                            connection.getOutputStream()
            ) {

                byte[] input =
                        requestJson
                                .toJSONString()
                                .getBytes(StandardCharsets.UTF_8);

                os.write(input);
                os.flush();
            }


            // =========================
            // 응답
            // =========================

            int status =
                    connection.getResponseCode();

            InputStream inputStream;

            if (status >= 200 && status < 300) {

                inputStream =
                        connection.getInputStream();

            } else {

                inputStream =
                        connection.getErrorStream();
            }


            StringBuilder response =
                    new StringBuilder();

            try (
                    BufferedReader reader =
                            new BufferedReader(
                                    new InputStreamReader(
                                            inputStream,
                                            StandardCharsets.UTF_8
                                    )
                            )
            ) {

                String line;

                while ((line = reader.readLine()) != null) {
                    response.append(line);
                }
            }


            String result =
                    response.toString();

            System.out.println(
                    "Kakao status = " + status
            );

            System.out.println(
                    "Kakao response = " + result
            );


            // 에러
            if (status < 200 || status >= 300) {

                return ResponseEntity
                        .status(status)
                        .body(result);
            }


            // =========================
            // JSON 변환
            // =========================

            JSONParser parser =
                    new JSONParser();

            JSONObject responseJson =
                    (JSONObject) parser.parse(result);


            // =========================
            // tid 저장
            // =========================

            String tid =
                    (String) responseJson.get("tid");

            if (tid == null) {

                return ResponseEntity
                        .status(HttpStatus.BAD_REQUEST)
                        .body("{\"result\":\"NO\"}");
            }


            session.setAttribute(
                    "tid",
                    tid
            );

            session.setAttribute(
                    "kakaoOrderNum",
                    order.getOr_num()
            );


            System.out.println(
                    "Kakao tid = " + tid
            );


            return ResponseEntity.ok(result);


        } catch (Exception e) {

            e.printStackTrace();

            return ResponseEntity
                    .status(HttpStatus.INTERNAL_SERVER_ERROR)
                    .body("{\"result\":\"NO\"}");
        }
    }

}
