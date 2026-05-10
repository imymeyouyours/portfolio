package greenbook.portfolio.dao;

import greenbook.portfolio.domain.MemberDto;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

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

}
