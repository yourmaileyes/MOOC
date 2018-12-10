package com.gdp.mooc.biz;

import java.util.List;
import java.util.Map;

import com.gdp.mooc.entity.Message;

public interface MessageBiz {
	int delete(Message record);
    Message select(Message record);
	    int insert(Message record);
    List<Message> selectmy(String userid);
}
