package greenbook.portfolio.domain;

import lombok.Data;

import java.util.Date;

@Data
public class MemberDto {
    private String me_id;
    private String me_nickname;
    private String me_password;
    private String me_gender;
    private String me_birth;
    private String me_phone;
    private String me_address;
    private String me_name;
    private String me_resident_num;
    private String me_email;
    private int me_point;
    private String me_grade;
    private String me_jAddress;
    private Boolean useCookie;
    private String me_session_id;
    private Date me_session_limit;
}
