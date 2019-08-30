package com.mooc.mapper;

import java.util.List;

import com.mooc.entity.Log;

public interface LogMapper {
	List<Log> select();
	List<Log> selectadminlog();
	List<Log> selectbyusername(String username);
	List<Log> selectadminlogbyusername(String username);
	int insert(Log log);
	int updateByPrimaryKeySelective(Log log);

}
