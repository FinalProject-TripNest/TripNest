package data.service;

import data.dto.WishlistDto;

public interface WishlistServiceInter {

	public void insertWishlist(WishlistDto dto);
	public int checkWishlist(WishlistDto dto);
	public void delectWishlist(WishlistDto dto);
}
