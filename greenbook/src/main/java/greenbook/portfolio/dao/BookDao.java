package greenbook.portfolio.dao;

import greenbook.portfolio.domain.BookDto;
import greenbook.portfolio.pagination.Criteria;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

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

}
