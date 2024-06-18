package data.service;

import java.util.List;

import data.dto.ImagesDto;

public interface ImageServiceInter {

	public void insertImage(ImagesDto dto);
	
	public List<ImagesDto> dataList();
}
