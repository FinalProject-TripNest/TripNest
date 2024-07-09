package data.dto;

import java.sql.Timestamp;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("WishlistDetailDto")
public class WishlistDetailDto{

	private String image_photo;
	private String member_useremail;
	private String room_id;
	private String room_name;
	private String room_region;
	private String room_min_capacity;
	private String room_max_capacity;
	private int room_price;
	private Timestamp wishlist_date;
}
