package greenbook.portfolio.service;

import greenbook.portfolio.dao.MemberDao;
import greenbook.portfolio.domain.MemberDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

@Service
public class MemberService {

    @Autowired
    MemberDao memberDao;

    @Autowired
    BCryptPasswordEncoder passwordEncoder;

    public MemberDto getLogin(MemberDto member) {

        MemberDto dbMember = memberDao.getLogin(member.getMe_id());

        // 비밀번호 불일치
        if (!passwordEncoder.matches(
                member.getMe_password(),
                dbMember.getMe_password())) {

            return null;
        }

        // 로그인 성공
        return dbMember;
    }

    public void updateLogin(MemberDto updateUser) {
        memberDao.updateLogin(updateUser);
    }

    public List<MemberDto> getEmail(String email) {
        return memberDao.getEmail(email);
    }

}