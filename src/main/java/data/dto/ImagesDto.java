package data.dto;

import org.apache.ibatis.type.Alias;
import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
@Alias("ImagesDto")
public class ImagesDto {

	private String image_id;
	private String room_id;
	private String image_photo;
	private MultipartFile photo;
}
