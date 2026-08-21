package greenbook.portfolio.domain;

import lombok.Data;

import java.math.BigInteger;

@Data
public class RegistrationDto {
	private int re_code;
	private BigInteger re_bk_isbn;
	private String re_title;
	private int re_price;
	private int re_amount;
	private String re_catagory;
	private String re_contents;
	private String re_choice;
	private int re_sales;
	
	
	public int getRe_price_point() {
		return (int)(re_price*0.05);
	}
}
