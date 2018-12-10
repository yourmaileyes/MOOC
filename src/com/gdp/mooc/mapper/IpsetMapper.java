package com.gdp.mooc.mapper;

import java.util.List;

import com.gdp.mooc.entity.Ipset;

public interface IpsetMapper {
	List<Ipset> select();
	Ipset selectip(String ip);
	int insert(Ipset ipset);
	int updateByPrimaryKeySelective(Ipset ipset);
}
