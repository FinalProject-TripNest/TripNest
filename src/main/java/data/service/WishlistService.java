package data.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import data.dto.WishlistDto;
import data.mapper.WishlistMapperInter;

@Service
public class WishlistService implements WishlistServiceInter {

	@Autowired
	WishlistMapperInter wishmapper;
	
	@Override
	public void insertWishlist(WishlistDto dto) {
		// TODO Auto-generated method stub
		wishmapper.insertWishlist(dto);
	}

	@Override
	public int checkWishlist(WishlistDto dto) {
		// TODO Auto-generated method stub
		return wishmapper.checkWishlist(dto);
	}

	@Override
	public void delectWishlist(WishlistDto dto) {
		// TODO Auto-generated method stub
		wishmapper.delectWishlist(dto);
	}

}
