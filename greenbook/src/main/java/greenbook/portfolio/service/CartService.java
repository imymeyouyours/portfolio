package greenbook.portfolio.service;

import greenbook.portfolio.dao.CartDao;
import greenbook.portfolio.domain.*;
import greenbook.portfolio.pagination.Criteria;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.math.BigInteger;
import java.util.List;

@Service
public class CartService {

    @Autowired
    CartDao cartDao;

    public void addCart(CartDto cart) {
        cartDao.addCart(cart);
    }

    public List<CartDto> getCartList(MemberDto user) {
        if(user == null)
            return null;
        return cartDao.getCartList(user.getMe_id());
    }

    public void getCartRegister(BigInteger[] checkList, Integer[] cartAmount, String id) {
        if(checkList == null && id == null) {
            return;
        }

        for(int i=0; i<checkList.length; i++) {
            CartDto dbCart = cartDao.selectCartRegister(checkList[i], id);

            if(dbCart != null) {
                dbCart.setCa_amount(dbCart.getCa_amount() + cartAmount[i]);
                cartDao.updateCartRegister(dbCart.getCa_num(), dbCart.getCa_amount());
            } else {
                cartDao.getCartRegister(checkList[i],cartAmount[i],id);
            }
        }
    }

    public List<CartDto> getPaymentList(Integer[] ca_num, MemberDto member) {

        if (ca_num == null || member == null) {
            return null;
        }

        return cartDao.getPaymentList(ca_num, member.getMe_id());
    }


    public List<CartDto> getPaymentList(BigInteger isbn, Integer amount) {

        if (isbn == null || amount == null) {
            return null;
        }

        return cartDao.getPaymentList(isbn, amount);
    }

    public int getTotalCountOrders() {
        return cartDao.getTotalCountOrders();
    }

    public List<OrderDto> adminOrderList(Criteria cri) {
        return cartDao.adminOrderList(cri);
    }

    public List<ParticularsDto> getParticularsList(String orNum) {
        return cartDao.getParticularsList(orNum);
    }

    public int updateCart(CartDto cart) {
        return cartDao.updateCart(cart);
    }

    public int insertShipping(ShippingDto shipping) {
        return cartDao.insertShipping(shipping);
    }

    public int insertPayFinished(OrderDto order) {
        order.setOr_num(order.setOr_random_num());
        return cartDao.insertPayFinished(order);
    }

    public int updateOrderState(String orNum) {
        return cartDao.updateOrderState(orNum);
    }

    public int insertPaymentInic(String apply_num, String pay_method, String me_name, String or_num, String formattedDate, String imp_uid) {
        return cartDao.insertPaymentInic(apply_num, pay_method, me_name, or_num, formattedDate, imp_uid);
    }

}
