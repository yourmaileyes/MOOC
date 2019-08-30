package com.mooc.mapper;

import java.util.List;
import java.util.Map;

import com.mooc.entity.User;

public interface UserMapper {
	List<User> selectAllUser();
	User selectLoginUser(Map map);
    int deleteByPrimaryKey(String id);

    int insert(User record);

    int insertSelective(User record);
    int selectByUserName(String username);
    User selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(User record);

    int updateByPrimaryKey(User record);
}