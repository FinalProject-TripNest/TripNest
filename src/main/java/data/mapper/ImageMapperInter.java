package data.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import data.dto.ImagesDto;


@Mapper
public interface ImageMapperInter {

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
