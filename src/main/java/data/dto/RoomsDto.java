package data.dto;

import java.util.List;

import org.apache.ibatis.type.Alias;

import lombok.Data;


@Data
@Alias("RoomsDto")
public class RoomsDto {
	private String room_id;
	private int member_id;
	private String room_name;
	private int room_price;
	private String room_rating;
	private String room_min_capacity;
	private String room_max_capacity;
	private String room_address;
	private String room_address_detail;
	private String room_region;
	private String room_service;
	private String room_detail;
	private String room_status;
	private String room_hp;
	private String city;
	private String district;
	private List<String> roomImgList;
	private String image_photo;

	private List<String> imgList;
	private String mememail;
	
	private String room_latitude;//위도
	private String room_longitude;//경도
}

