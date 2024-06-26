package data.dto;

import java.sql.Timestamp;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("ReviewJoinDto")
public class ReviewJoinDto {
    private int review_id;
    private int member_id;
    private int room_id;
    private String review_content;
    private int review_rating;
    private Timestamp review_date;
    private String member_name;
    private String member_useremail;
    private String room_name;
}
