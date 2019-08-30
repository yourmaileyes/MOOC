package com.mooc.biz.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mooc.biz.IpsetBiz;
import com.mooc.entity.Ipset;
import com.mooc.mapper.IpsetMapper;
@Service(value="IpsetBiz")
public class IpsetBizImpl implements IpsetBiz{
	@Autowired
	IpsetMapper ipsetMapper;

	@Override
	public List<Ipset> select() {
		// TODO Auto-generated method stub
		return ipsetMapper.select();
	}

	@Override
	public Ipset selectip(String ip) {
		// TODO Auto-generated method stub
		return ipsetMapper.selectip(ip);
	}

	@Override
	public int insert(Ipset ipset) {
		// TODO Auto-generated method stub
		return ipsetMapper.insert(ipset);
	}

	@Override
	public int updateByPrimaryKeySelective(Ipset ipset) {
		// TODO Auto-generated method stub
		return ipsetMapper.updateByPrimaryKeySelective(ipset);
	}

}
