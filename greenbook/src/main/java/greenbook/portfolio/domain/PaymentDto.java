package greenbook.portfolio.domain;

import lombok.Data;

@Data
public class PaymentDto {
	private String pa_num;
	private String pa_methods;
	private String pa_name;
	private String pa_or_num;
	private Long pa_point;
	private String imp_uid;
	//private String merchant_uid;
}
