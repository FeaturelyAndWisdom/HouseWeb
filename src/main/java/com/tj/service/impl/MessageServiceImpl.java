package com.tj.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.tj.mapper.MessageMapper;
import com.tj.po.Message;
import com.tj.service.IMessageService;

@Service("MessageServiceImpl")
@Transactional
public class MessageServiceImpl implements IMessageService {
	
	@Resource(name="MesMapper")
	private MessageMapper mm;

	@Override
	public List<Message> custmessflushByUid(int uid) throws Exception {
		// TODO Auto-generated method stub
		return mm.findCustMesByUid(uid);
	}

	@Override
	public List<Message> sellmessflushByUid(int uid) throws Exception {
		// TODO Auto-generated method stub
		return mm.findSellerMesByUid(uid);
	}
	

}
