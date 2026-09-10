package greenbook.portfolio.domain;

import lombok.Data;

import java.math.BigInteger;

@Data
public class ParticularsDto {
	private int pr_num;
	private String pr_or_num;
	private BigInteger pr_bk_isbn;
	private int pr_amount;
	private String pr_title;
	private int pr_price;
	private int pr_use_point;
	
	public int getEachPoint() {
		return (int)(pr_price * pr_amount * 0.05);
	}
}
