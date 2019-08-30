package com.mooc.biz.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mooc.biz.LogBiz;
import com.mooc.entity.Log;
import com.mooc.mapper.LogMapper;
@Service(value="LogBiz")
public class LogBizImpl implements LogBiz {
	@Autowired
    LogMapper logmapper;
	@Override
	public List<Log> select() {
		// TODO Auto-generated method stub
		return logmapper.select();
	}

	@Override
	public List<Log> selectadminlog() {
		// TODO Auto-generated method stub
		return logmapper.selectadminlog();
	}

	@Override
	public List<Log> selectbyusername(String username) {
		// TODO Auto-generated method stub
		return logmapper.selectbyusername(username);
	}

	@Override
	public int insert(Log log) {
		// TODO Auto-generated method stub
		return logmapper.insert(log);
	}

	@Override
	public int updateByPrimaryKeySelective(Log log) {
		// TODO Auto-generated method stub
		return logmapper.updateByPrimaryKeySelective(log);
	}

	@Override
	public List<Log> selectadminlogbyusername(String username) {
		// TODO Auto-generated method stub
		return logmapper.selectadminlogbyusername(username);
	}

}
