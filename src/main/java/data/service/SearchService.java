package data.service;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import data.dto.ReservationDto;
import data.dto.RoomsDto;
import data.mapper.SearchMapperInter;

@Service
public class SearchService implements SearchServiceInter {

	 	@Autowired
	    private SearchMapperInter mapperInter;
	 	
	 	

	    public List<RoomsDto> findHotelsNearby(double latitude, double longitude, double errorRange, String checkin, String checkout, Integer personnel) {
	        double minLatitude = latitude - errorRange;
	        double maxLatitude = latitude + errorRange;
	        double minLongitude = longitude - errorRange;
	        double maxLongitude = longitude + errorRange;

	        return mapperInter.findHotelsNearby(minLatitude, maxLatitude, minLongitude, maxLongitude, checkin, checkout, personnel);
	    }
	    
	    @Override
		public List<ReservationDto> getReservationsByRoomId(String room_id){
			
			return mapperInter.getReservationsByRoomId(room_id);
		};
	}

