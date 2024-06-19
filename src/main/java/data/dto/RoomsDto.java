package data.dto;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("RoomsDto")
public class RoomsDto {
	private String room_id;
	private String member_id;
	private String room_name;
	private int room_price;
	private String room_rating;
	private String room_min_capacity;
	private String room_max_capacity;
	private String room_address;
	private String room_service;
	private String room_detail;
	private String room_staus;
	private String room_hp;
	private String city;
	private String district;

}
