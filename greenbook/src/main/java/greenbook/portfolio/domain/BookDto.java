package greenbook.portfolio.domain;

import lombok.Getter;
import org.springframework.format.annotation.DateTimeFormat;

import java.math.BigInteger;
import java.text.SimpleDateFormat;
import java.util.Date;

@Getter
public class BookDto {
    private BigInteger bk_isbn;
    private String bk_title;
    private String bk_subtitle;
    private String bk_au_writer;
    private String bk_publish;
    private int bk_page;
    private String bk_country;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date bk_publish_date;
    private String bk_mainImg;
    private int bk_pu_num;
    private String bk_contents;
    private int bk_price;
    private int bk_code;

    public String getDate() {
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
        return format.format(bk_publish_date);
    }
}
