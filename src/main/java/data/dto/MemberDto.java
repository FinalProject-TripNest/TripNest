package data.dto;

import java.sql.Timestamp;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("MemberDto")
public class MemberDto {

	private String member_id;
	private String member_name;
	private String member_useremail;
	private String member_password;
	private String member_phone;
	private Timestamp member_registration_date;
	private Timestamp member_birth_date;
	private String member_role;
}
