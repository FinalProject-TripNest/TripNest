package data.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import data.dto.ImagesDto;
import data.mapper.ImageMapperInter;

@Service
public class ImageService implements ImageServiceInter {

	@Autowired
	ImageMapperInter imgmapper;

	@Override
	public void insertImage(ImagesDto dto) {
		// TODO Auto-generated method stub
		imgmapper.insertImage(dto);
	}

	@Override
	public List<ImagesDto> dataList() {
		// TODO Auto-generated method stub
		return imgmapper.dataList();
	}

	@Override
	public ImagesDto getOneData(String image_id) {
		// TODO Auto-generated method stub
		return imgmapper.getOneData(image_id);
	}

	@Override
	public List<ImagesDto> imgList(String room_id) {
		return imgmapper.imgList(room_id);
	}

	@Override
	public void deleteImage(String room_id) {
		// TODO Auto-generated method stub
		imgmapper.deleteImage(room_id);
	}

	@Override
	public void updateimage(ImagesDto dto) {
		// TODO Auto-generated method stub
		imgmapper.updateimage(dto);
	}

}
