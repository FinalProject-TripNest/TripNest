package data.dto;

import java.sql.Timestamp;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("PromotionDto")
public class PromotionDto {

	private String promotion_id;
	private String promotion_title;
	private String promotion_content;
	private Timestamp promotion_date;
	private String promotion_photo;
	private String promotion_explanation;

}
