package data.service;

import java.util.Date;
import java.util.List;

import data.dto.RoomsDto;

public interface SearchServiceInter {

	public List<RoomsDto> findHotelsNearby(double latitude, double longitude, double errorRange, Date checkin, Date checkout, Integer personnel);
}
