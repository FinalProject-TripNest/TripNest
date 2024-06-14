package data.mapper;

import org.apache.ibatis.annotations.Mapper;

import data.dto.ImagesDto;

@Mapper
public interface ImageMapperInter {

	public void insertImage(ImagesDto dto);
}
