package com.tj.service;

import java.util.List;

import com.tj.po.Message;

public interface IMessageService {
	
	public List<Message> custmessflushByUid(int uid) throws Exception;
	
	public List<Message> sellmessflushByUid(int uid) throws Exception;
}
