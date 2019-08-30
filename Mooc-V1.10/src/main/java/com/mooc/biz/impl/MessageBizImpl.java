package com.mooc.biz.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mooc.biz.MessageBiz;
import com.mooc.entity.Message;
import com.mooc.mapper.MessageMapper;
@Service(value="MessageBiz")
public class MessageBizImpl implements MessageBiz {
	@Autowired
	MessageMapper messageMapper;

	@Override
	public int delete(Message record) {
		// TODO Auto-generated method stub
		return messageMapper.delete(record);
	}

	@Override
	public Message select(Message record) {
		// TODO Auto-generated method stub
		return messageMapper.select(record);
	}

	@Override
	public int insert(Message record) {
		// TODO Auto-generated method stub
		return messageMapper.insert(record);
	}

	@Override
	public List<Message> selectmy(String userid) {
		// TODO Auto-generated method stub
		return messageMapper.selectMy(userid);
	}

}
