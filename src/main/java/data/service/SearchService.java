package data.service;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import data.dto.RoomsDto;
import data.mapper.SearchMapperInter;

@Service
public class SearchService implements SearchServiceInter {

	 @Autowired
	    private SearchMapperInter hotelMapper;

	    public List<RoomsDto> findHotelsNearby(double latitude, double longitude, double errorRange, Date checkin, Date checkout, Integer personnel) {
	        double minLatitude = latitude - errorRange;
	        double maxLatitude = latitude + errorRange;
	        double minLongitude = longitude - errorRange;
	        double maxLongitude = longitude + errorRange;

	        return hotelMapper.findHotelsNearby(minLatitude, maxLatitude, minLongitude, maxLongitude, checkin, checkout, personnel);
	    }
	}

