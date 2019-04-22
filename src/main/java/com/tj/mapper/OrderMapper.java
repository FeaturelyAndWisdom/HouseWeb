package com.tj.mapper;

import java.util.List;

import org.springframework.stereotype.Service;

import com.tj.po.Orders;

@Service("OrderMapper")
public interface OrderMapper {
	
	public int add(Orders order) throws Exception;
	
	public List<Orders> getOrdersBySellid(int uid) throws Exception;
	
	public List<Orders> getOrdersByUid(int uid) throws Exception;
	
	public Orders getOrderByOid(int oid) throws Exception;
	
	public int accompOrder(int oid) throws Exception; 
	
	public int commentOrder(int oid) throws Exception;
	
	public List<Orders> getNosayOrdersByUid(int uid) throws Exception;
	
	public List<Orders> getsayOrdersByUid(int uid) throws Exception;
	
	public List<Orders> getAllOrder() throws Exception;
	
	public List<Orders> getsayOrders() throws Exception;
	
	public int delOrders(int oid) throws Exception;
	
}
