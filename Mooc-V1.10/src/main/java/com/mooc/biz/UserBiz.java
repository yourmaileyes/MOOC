package com.mooc.biz;

import java.util.List;
import java.util.Map;

import com.mooc.entity.User;

public interface UserBiz {
	int deleteByPrimaryKey(String id);
	 User selectByPrimaryKey(String id);
	List<User> selectAllUser();
public User selectLoginUser(Map map);
public int selectUser(Map map);
public int selectUser(String username);
int insertSelective(User record);
int updateByPrimaryKeySelective(User record);
}
