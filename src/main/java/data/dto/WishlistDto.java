package data.dto;

import java.sql.Timestamp;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("WishlistDto")
public class WishlistDto {

	private String wishlist_id;
	private String member_useremail;
	private String room_id;
	private Timestamp wishlist_date;
}
