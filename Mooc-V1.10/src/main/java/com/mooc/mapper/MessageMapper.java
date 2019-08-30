package com.mooc.mapper;

import java.util.List;
import java.util.Map;

import com.mooc.entity.Message;

public interface MessageMapper {
	 int delete(Message record);
      Message select(Message record);
	    int insert(Message record);
      List<Message> selectMy(String userid);
}
