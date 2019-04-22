package com.tj.mapper;

import java.util.List;

import org.springframework.stereotype.Service;

import com.tj.po.Message;

@Service("MesMapper")
public interface MessageMapper {
	
	public List<Message> findCustMesByUid(int uid) throws Exception;
	
	public List<Message> findSellerMesByUid(int uid) throws Exception;
	
	public int sendMess(Message mes) throws Exception;
	
	public int readCustMes(int uid) throws Exception;
	
	public int readSellMes(int uid) throws Exception;
}
