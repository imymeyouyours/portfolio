package greenbook.portfolio.dao;

import greenbook.portfolio.domain.AuthorDto;
import greenbook.portfolio.domain.MemberDto;
import greenbook.portfolio.domain.PointDto;
import greenbook.portfolio.pagination.Criteria;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.math.BigInteger;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Repository
public class MemberDao {

    @Autowired
    private SqlSession session;
    private static String namespace = "greenbook.portfolio.dao.MemberMapper.";


    public MemberDto getLogin(String id) {
        return session.selectOne(namespace + "getMember", id);
    }

    public void updateLogin(MemberDto updateUser) {
        session.update(namespace + "updateLogin", updateUser);
    }

    public List<MemberDto> getEmail(String email) {
        return session.selectList(namespace + "getEmail", email);
    }

    public List<AuthorDto> getAuthorList(BigInteger re_bk_isbn) {
        return session.selectList(namespace + "getAuthorList", re_bk_isbn);
    }

    public int getTotalCountGreenPoint(String id) {
        return session.selectOne(
                namespace + "getTotalCountGreenPoint",
                id
        );
    }

    public List<PointDto> getPointList(String id, Criteria cri) {

        Map<String, Object> map = new HashMap<>();

        map.put("id", id);
        map.put("cri", cri);

        return session.selectList(namespace+"getPointList", map);
    }
}
