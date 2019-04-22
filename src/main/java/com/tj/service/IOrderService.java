package com.tj.service;

import java.util.List;

import com.tj.po.Orders;

public interface IOrderService {
	
	public boolean save(Orders order) throws Exception;
	
	public List<Orders> getOrdersBySellid(int uid) throws Exception;
	
	public List<Orders> getOrdersByUid(int uid) throws Exception;
	
	public Orders getOrderByOid(int oid) throws Exception;
	
	public boolean accompOrder(int oid) throws Exception;
	
	public boolean commentOrder(int oid) throws Exception;
	
	public List<Orders> getNosayOrdersByUid(int uid) throws Exception;
	
	public List<Orders> getsayOrdersByUid(int uid) throws Exception;
	
	public List<Orders> getAllOrder() throws Exception;
	
	public List<Orders> getsayOrders() throws Exception;
	
	public boolean deleOrder(int oid) throws Exception;
}
