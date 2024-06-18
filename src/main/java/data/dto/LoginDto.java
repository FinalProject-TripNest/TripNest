package data.dto;

import lombok.Data;
import org.apache.ibatis.type.Alias;

@Data
@Alias("LoginDto")
public class LoginDto {
    private String email;
    private String password;
}
