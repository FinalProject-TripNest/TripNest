package data.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import data.dto.RoomsDto;

@Mapper
public interface RoomsMapperInter {

	public void insertRoom(RoomsDto dto);
	public int getLastInsertedRoomId();
	public List<RoomsDto> dataList();
}
