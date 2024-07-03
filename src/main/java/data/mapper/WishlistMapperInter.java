package data.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import data.dto.WishlistDetailDto;
import data.dto.WishlistDto;

@Mapper
public interface WishlistMapperInter {

	public void insertWishlist(WishlistDto dto);
	public int checkWishlist(WishlistDto dto);
	public void delectWishlist(WishlistDto dto);
	public List<WishlistDetailDto> myWishList(String member_useremail);
}
