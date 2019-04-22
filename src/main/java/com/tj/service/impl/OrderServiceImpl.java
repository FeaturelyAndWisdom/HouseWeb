package com.tj.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.github.pagehelper.PageHelper;
import com.tj.mapper.OrderMapper;
import com.tj.po.Orders;
import com.tj.service.IOrderService;

@Service("OrderServiceImpl")
@Transactional
public class OrderServiceImpl implements IOrderService {
	
	@Resource(name="OrderMapper")
	private OrderMapper om; 
	
	@Override
	public boolean save(Orders order) throws Exception {
		int count = om.add(order);
		if(count>0) return true;
		return false;
	}

	@Override
	public List<Orders> getOrdersBySellid(int uid) throws Exception {
		return om.getOrdersBySellid(uid);
	}

	@Override
	public List<Orders> getOrdersByUid(int uid) throws Exception {
		// TODO Auto-generated method stub
		return om.getOrdersByUid(uid);
	}

	@Override
	public Orders getOrderByOid(int oid) throws Exception {
		// TODO Auto-generated method stub
		return om.getOrderByOid(oid);
	}

	@Override
	public boolean accompOrder(int oid) throws Exception {
		int count = om.accompOrder(oid);
		if(count>0) return true;
		return false;
	}

	@Override
	public boolean commentOrder(int oid) throws Exception {
		int count = om.commentOrder(oid);
		if(count>0) return true;
		return false;
	}

	@Override
	public List<Orders> getNosayOrdersByUid(int uid) throws Exception {
		return om.getNosayOrdersByUid(uid);
	}

	@Override
	public List<Orders> getsayOrdersByUid(int uid) throws Exception {
		// TODO Auto-generated method stub
		return om.getsayOrdersByUid(uid);
	}

	@Override
	public List<Orders> getAllOrder() throws Exception {
		List<Orders> olst = om.getAllOrder();
		return olst;
	}

	@Override
	public List<Orders> getsayOrders() throws Exception {
		// TODO Auto-generated method stub
		return om.getsayOrders();
	}

	@Override
	public boolean deleOrder(int oid) throws Exception {
		int count = om.delOrders(oid);
		if(count>0) return true;
		return false;
	}

}
