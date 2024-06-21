package data.dto;

import java.sql.Timestamp;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("InqueryDto")
public class InqueryDto {

	private String inquery_id;
	private String inquery_title;
	private String inquery_content;
	private Timestamp inquery_date;
	private String inquery_category;
	private int member_id;
	private String inquery_answer;
}
