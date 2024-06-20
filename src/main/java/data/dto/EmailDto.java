package data.dto;

import java.util.Date;
import org.apache.ibatis.type.Alias;
import lombok.Data;

@Data
@Alias("EmailDto")
public class EmailDto {
    private String email_id;
    private String member_useremail;
    private String email_token;
    private boolean email_verified;
    private Date email_created_at;
}
