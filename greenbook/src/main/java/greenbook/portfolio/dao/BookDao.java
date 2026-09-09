package greenbook.portfolio.dao;

import greenbook.portfolio.domain.BookDto;
import greenbook.portfolio.domain.RegistrationDto;
import greenbook.portfolio.pagination.Criteria;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.math.BigInteger;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


@Repository
public class BookDao {
    @Autowired
    private SqlSession session;
    private static String namespace = "greenbook.portfolio.dao.BookMapper.";

    public List<BookDto> getChoice() {
        return session.selectList(namespace + "selectChoice");
    }

    public BookDto getBookTody() {
        return session.selectOne(namespace + "selectToday");
    }

    public List<BookDto> getBestSeller() {
        return session.selectList(namespace + "selectBestSeller");
    }

    public List<BookDto> getRegistration(
            String reCatagory,
            Criteria cri) {

        Map<String, Object> params = new HashMap<>();

        params.put("re_catagory", reCatagory);
        params.put("cri", cri);

        return session.selectList(
                namespace + "selectRegistration",
                params
        );
    }

    public int getTotalCountCatagory(
            String reCatagory,
            Criteria cri) {

        Map<String, Object> params = new HashMap<>();

        params.put("re_catagory", reCatagory);
        params.put("cri", cri);

        return session.selectOne(
                namespace + "selectTotalCatagory",
                params
        );
    }

    public BookDto getBookDetails(BigInteger re_bk_isbn) {
        return session.selectOne(namespace+"getBook", re_bk_isbn);
    }

    public RegistrationDto getRegi(BigInteger re_bk_isbn) {
        return session.selectOne(namespace+"selectRegi", re_bk_isbn);
    }

    public int getTotalCount(Criteria cri) {
        return session.selectOne(namespace+"getTotalCount", cri);
    }

    public List<BookDto> getBookList(Criteria cri) {
        return session.selectList(namespace+"getBookList", cri);
    }

    public int getBookInfo(BookDto book) {
        return session.insert(namespace+"getBookInfo",book);
    }

    public int updateBook(BookDto book) {
        return session.update(namespace+"updateBook", book);
    }

    public int getTotalCountRegi() {
        return session.selectOne(namespace+"getTotalCountRegi");
    }

    public List<RegistrationDto> regiBookList(Criteria cri) {
        return session.selectList(namespace+"regiBookList",cri);
    }

    public RegistrationDto getRegiBook(Integer re_code) {
        return session.selectOne(namespace+"getRegiBook", re_code);
    }

    public int updateRegi(RegistrationDto regi) {
        return session.update(namespace+"updateRegi", regi);
    }

    public int regiBook(RegistrationDto regi) {
        return session.update(namespace+"regiBook", regi);
    }

}
