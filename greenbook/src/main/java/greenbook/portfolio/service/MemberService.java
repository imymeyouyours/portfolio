package greenbook.portfolio.service;

import greenbook.portfolio.dao.MemberDao;
import greenbook.portfolio.domain.AuthorDto;
import greenbook.portfolio.domain.MemberDto;
import greenbook.portfolio.domain.PointDto;
import greenbook.portfolio.pagination.Criteria;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import java.math.BigInteger;
import java.util.Date;
import java.util.List;
import java.util.regex.Pattern;

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

    public List<AuthorDto> getAuthorList(BigInteger re_bk_isbn) {
        return memberDao.getAuthorList(re_bk_isbn);
    }

    public int getTotalCountGreenPoint(String id) {
        return memberDao.getTotalCountGreenPoint(id);
    }


    public List<PointDto> getPointList(String id, Criteria cri) {
        return memberDao.getPointList(id, cri);
    }

    public MemberDto updateMember(MemberDto user) {

        if (user == null || user.getMe_id() == null) {
            return null;
        }

        String emailRegex =
                "\\w+@\\w+\\.\\w+(\\.\\w+)?";

        if (user.getMe_email() == null ||
                !Pattern.matches(
                        emailRegex,
                        user.getMe_email()
                )) {
            return null;
        }

        if (user.getMe_name() == null ||
                user.getMe_name().trim().isEmpty()) {
            return null;
        }

        if (user.getMe_gender() == null ||
                !(user.getMe_gender().equals("F") ||
                        user.getMe_gender().equals("M"))) {
            return null;
        }


        // DB에 저장된 기존 회원정보 조회
        MemberDto dbUser =
                memberDao.getMember(
                        user.getMe_id()
                );

        if (dbUser == null) {
            return null;
        }


        // 수정 가능한 기본 정보
        dbUser.setMe_gender(
                user.getMe_gender()
        );

        dbUser.setMe_email(
                user.getMe_email()
        );

        dbUser.setMe_nickname(
                user.getMe_nickname()
        );

        dbUser.setMe_phone(
                user.getMe_phone()
        );


        // 비밀번호 수정
        String password =
                user.getMe_password();

        if (password != null &&
                !password.trim().isEmpty()) {

            String pwRegex =
                    "^[a-zA-Z0-9!@#]{8,16}$";

            if (!Pattern.matches(
                    pwRegex,
                    password
            )) {
                return null;
            }

            String encodePw =
                    passwordEncoder.encode(
                            password
                    );

            dbUser.setMe_password(
                    encodePw
            );
        }


        // 주소 수정
        if (user.getMe_address() != null &&
                user.getMe_address()
                        .trim()
                        .length() > 3) {

            dbUser.setMe_address(
                    user.getMe_address()
            );
        }


        if (user.getMe_jAddress() != null &&
                user.getMe_jAddress()
                        .trim()
                        .length() > 3) {

            dbUser.setMe_jAddress(
                    user.getMe_jAddress()
            );
        }


        // 생년월일 수정
        if (user.getMe_birth() != null &&
                user.getMe_birth()
                        .trim()
                        .length() > 4) {

            dbUser.setMe_birth(
                    user.getMe_birth()
            );
        }


        int result =
                memberDao.updateMember(
                        dbUser
                );

        if (result == 0) {
            return null;
        }

        return dbUser;
    }
}