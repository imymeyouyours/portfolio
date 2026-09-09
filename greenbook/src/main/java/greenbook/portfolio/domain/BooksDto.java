package greenbook.portfolio.domain;

import lombok.Data;

import java.math.BigInteger;

@Data
public class BooksDto {
	private int bs_num;
	private BigInteger bs_bk_isbn;
	private String bs_part;
	private String bs_name;
	private String bs_au_num;
	private String bs_title;
	private String bs_contents;
	private String bs_birth;
	private String bs_mainImg;
}
