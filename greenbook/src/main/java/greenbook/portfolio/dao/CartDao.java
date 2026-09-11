package greenbook.portfolio.dao;

import greenbook.portfolio.domain.*;
import greenbook.portfolio.pagination.Criteria;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.math.BigInteger;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Repository
public class CartDao {

    @Autowired
    private SqlSession session;
    private static String namespace = "greenbook.portfolio.dao.CartMapper.";

    public int addCart(CartDto cart) {
        return session.insert(namespace + "addCart", cart);
    }

    public List<CartDto> getCartList(String id) {
        return session.selectList(namespace+"getCartList", id);
    }

    public CartDto selectCartRegister(BigInteger bkIsbn, String id) {

        Map<String, Object> map = new HashMap<>();

        map.put("bkIsbn", bkIsbn);
        map.put("id",id);

        return session.selectOne(namespace+"selectCartRegister", map);
    }

    public int updateCartRegister(int caNum, int amount) {

        Map<String, Object> map = new HashMap<>();

        map.put("caNum", caNum);
        map.put("amount", amount);

        return session.update(namespace+"updateCartRegister", map);
    }

    public int getCartRegister(BigInteger bkIsbn, int amount, String id) {

        Map<String, Object> map = new HashMap<>();

        map.put("bkIsbn", bkIsbn);
        map.put("amount", amount);
        map.put("id", id);

        return session.insert(namespace+"getCartRegister",map);
    }

    public List<CartDto> getPaymentList(Integer[] ca_num, String id) {

        Map<String, Object> map = new HashMap<>();

        map.put("caNum", ca_num);
        map.put("id", id);

        return session.selectList(
                namespace + "getPaymentList",
                map
        );
    }

    public List<CartDto> getPaymentList(BigInteger isbn, Integer amount) {

        Map<String, Object> map = new HashMap<>();

        map.put("isbn", isbn);
        map.put("amount", amount);

        return session.selectList(
                namespace + "getPaymentListDirect",
                map
        );
    }

    public int getTotalCountOrders() {
        return session.selectOne(namespace +"getTotalCountOrders");
    }

    public List<OrderDto> adminOrderList(Criteria cri) {
        return session.selectList(namespace+"adminOrderList", cri);
    }

    public List<ParticularsDto> getParticularsList(String orNum) {
        return session.selectList(namespace+"getParticularsList", orNum);
    }

    public int updateCart(CartDto cart) {
        return session.update(namespace+"updateCart", cart);
    }

    public int insertShipping(ShippingDto shipping) {
        return session.insert(namespace+"insertShipping", shipping);
    }

    public int insertPayFinished(OrderDto order) {
        return session.insert(namespace+"insertPayFinished",order);
    }

    public int updateOrderState(String orNum) {
        return session.update(namespace+"updateOrderState", orNum);
    }

    public int insertPaymentInic(String apply_num, String pay_method, String me_name, String or_num, String formattedDate, String imp_uid) {

        Map<String, Object> map = new HashMap<>();

        map.put("apply_num", apply_num);
        map.put("pay_method", pay_method);
        map.put("me_name", me_name);
        map.put("or_num", or_num);
        map.put("formattedDate", formattedDate);
        map.put("imp_uid", imp_uid);

        return session.insert(namespace+"insertPaymentInic", map);
    }
}
