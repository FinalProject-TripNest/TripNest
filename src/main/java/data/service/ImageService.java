package data.service;

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

}