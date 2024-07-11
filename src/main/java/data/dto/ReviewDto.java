package data.dto;

import java.sql.Timestamp;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("ReviewDto")
public class ReviewDto {

	private int review_id;
	private int member_id;
	private int room_id;
	private String review_content;
	private int review_rating;
	private Timestamp review_date;
}
