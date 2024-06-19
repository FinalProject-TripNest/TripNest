package data.dto;

import java.util.Date;
import org.apache.ibatis.type.Alias;
import lombok.Data;

@Data
@Alias("MemberDto")
public class MemberDto {
    private int member_id;
    private String member_name;
    private String member_useremail;
    private String member_password;
    private String member_phone;
    private Date member_registration_date;
    private Date member_birth_date;
    private String member_role;
}
