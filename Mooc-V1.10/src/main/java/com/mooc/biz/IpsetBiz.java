package com.mooc.biz;

import java.util.List;

import com.mooc.entity.Ipset;

public interface IpsetBiz {
	List<Ipset> select();
	Ipset selectip(String ip);
	int insert(Ipset ipset);
	int updateByPrimaryKeySelective(Ipset ipset);
}
