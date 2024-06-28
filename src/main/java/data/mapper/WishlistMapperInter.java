package data.mapper;

import org.apache.ibatis.annotations.Mapper;

import data.dto.WishlistDto;

@Mapper
public interface WishlistMapperInter {

	public void insertWishlist(WishlistDto dto);
	public int checkWishlist(WishlistDto dto);
	public void delectWishlist(WishlistDto dto);
}
