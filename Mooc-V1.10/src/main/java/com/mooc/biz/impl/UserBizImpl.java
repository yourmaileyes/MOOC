package com.mooc.biz.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mooc.biz.UserBiz;
import com.mooc.entity.User;
import com.mooc.mapper.UserMapper;
@Service(value="UserBiz")
public class UserBizImpl implements UserBiz{
	@Autowired
    UserMapper userMapper;
	@Override
	public User selectLoginUser(Map map) {
		// TODO Auto-generated method stub
		return userMapper.selectLoginUser(map);
	}
	@Override
	public int selectUser(Map map) {
		// TODO Auto-generated method stub
		User user = userMapper.selectLoginUser(map);
		if(user==null)
			return 0;
		else
		return 1;
	}
	@Override
	public int selectUser(String username) {
		
		return userMapper.selectByUserName(username);
	}
	@Override
	public int insertSelective(User record) {
		// TODO Auto-generated method stub
		return userMapper.insertSelective(record);
	}
	@Override
	public int updateByPrimaryKeySelective(User record) {
		// TODO Auto-generated method stub
		return userMapper.updateByPrimaryKeySelective(record);
	}
	@Override
	public List<User> selectAllUser() {
		// TODO Auto-generated method stub
		return userMapper.selectAllUser();
	}
	@Override
	public User selectByPrimaryKey(String id) {
		// TODO Auto-generated method stub
		return userMapper.selectByPrimaryKey(id);
	}
	@Override
	public int deleteByPrimaryKey(String id) {
		// TODO Auto-generated method stub
		return userMapper.deleteByPrimaryKey(id);
	}

}
