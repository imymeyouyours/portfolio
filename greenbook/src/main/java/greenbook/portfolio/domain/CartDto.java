package greenbook.portfolio.domain;

import lombok.Data;

import java.math.BigInteger;

@Data
public class CartDto {
	private int ca_num;
	private int ca_amount;
	private int ca_re_code;
	private String ca_me_id;
	private String ca_valid;
	private String ca_mainImg;
	private String ca_title;
	private String ca_subTitle;
	private int ca_price;	
	private BigInteger ca_isbn;
	private int ca_re_amount;
	
	public int getCa_total_price(){
		return ca_price * ca_amount;
	}
	

}
