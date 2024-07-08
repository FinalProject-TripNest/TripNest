package data.dto;

import java.sql.Timestamp;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("JournalDto")
public class JournalDto {

	private String journal_id;
	private String journal_title;
	private String journal_content;
	private Timestamp journal_date;
	private String journal_photo;
}
