package data.service;

import java.util.List;

import data.dto.WishlistDetailDto;
import data.dto.WishlistDto;

public interface WishlistServiceInter {

	public void insertWishlist(WishlistDto dto);
	public int checkWishlist(WishlistDto dto);
	public void delectWishlist(WishlistDto dto);
	public List<WishlistDetailDto> myWishList(String member_useremail);
}
