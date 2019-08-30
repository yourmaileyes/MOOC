package com.mooc.biz.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mooc.biz.ReviewBiz;
import com.mooc.entity.Review;
import com.mooc.mapper.ReviewMapper;
@Service(value="ReviewBiz")
public class ReviewBizImpl implements ReviewBiz{
	@Autowired
	ReviewMapper ReviewMapper;
	@Override
	public List<Review> select(int courseid) {
		// TODO Auto-generated method stub
		return ReviewMapper.select(courseid);
	}

	@Override
	public int delete(Review review) {
		// TODO Auto-generated method stub
		return ReviewMapper.delete(review);
	}

	@Override
	public int insert(Review review) {
		// TODO Auto-generated method stub
		return ReviewMapper.insert(review);
	}

	@Override
	public String avglable(int courseid) {//返回平均评价
		// TODO Auto-generated method stub
		int a=0;
		List<Review> reviews = ReviewMapper.select(courseid);
		for(Review review:reviews){
			a+=review.getLable();
		}
		a/=reviews.size()+1;
		if(a<1.5){
			return "一般";
		}else
		if(a<2.5){
			return "还行";
		}else
		if(a<3.5){
			return "不错";
		}else
		return "非常好";
	}

	@Override
	public List<Review> selectbyuserid(String username) {
		// TODO Auto-generated method stub
		return ReviewMapper.selectbyuserid(username);
	}

	@Override
	public int updateByPrimaryKeySelective(List<Review> reviews) {
		// TODO Auto-generated method stub
		for(Review review:reviews){
			ReviewMapper.updateByPrimaryKeySelective(review);
		}
		return 0;
	}

}
