package data.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import data.dto.ImagesDto;

@Mapper
public interface ImageMapperInter {

	public void insertImage(ImagesDto dto);
	public List<ImagesDto> getAllRoomPhoto();
	public ImagesDto getDataRoomImg(String room_id);
}
