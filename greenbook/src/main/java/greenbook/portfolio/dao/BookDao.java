package greenbook.portfolio.dao;

import greenbook.portfolio.domain.BookDto;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;


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
}
