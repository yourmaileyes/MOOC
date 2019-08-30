package com.mooc.mapper;



import java.util.List;

import com.mooc.entity.Review;

public interface ReviewMapper {
 List<Review> select(int courseid);
 int delete(Review review);
 int insert(Review review);
 List<Review> selectbyuserid(String username);
 int updateByPrimaryKeySelective(Review review);
}
