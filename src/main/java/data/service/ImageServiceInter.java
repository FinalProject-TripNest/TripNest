package data.service;

import java.util.List;

import data.dto.ImagesDto;

public interface ImageServiceInter {

	public void insertImage(ImagesDto dto);

	public List<ImagesDto> getAllRoomPhoto();
	public List<ImagesDto> getDataRoomImg(String room_id);

	public List<ImagesDto> dataList();

	public ImagesDto getOneData(String image_id);

	public List<ImagesDto> imgList(String room_id);
	
	public List<ImagesDto> hotelNearbyImages(List<String> roomIds); 

	public void deleteImage(String room_id);
	
	public void updateimage(ImagesDto dto);

}
