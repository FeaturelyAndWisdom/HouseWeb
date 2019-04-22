package com.tj.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.tj.mapper.CommentMapper;
import com.tj.po.Comment;
import com.tj.service.ICommentService;

@Service("CommentServiceImpl")
@Transactional
public class CommentServiceImpl implements ICommentService {
	
	@Resource(name="CommentMapper")
	private CommentMapper cm;
	
	@Override
	public boolean save(Comment comment) throws Exception {
		// TODO Auto-generated method stub
		int count = cm.add(comment);
		if(count>0) return true;
		return false;
	}

	@Override
	public Comment findCommentByCid(int cid) throws Exception {
		return cm.findCommentByCid(cid);
	}

	@Override
	public List<Comment> findCommsByHid(int hid) throws Exception {
		// TODO Auto-generated method stub
		return cm.findCommsByHid(hid);
	}

	@Override
	public List<Comment> findCommsBySeller(int sellid) throws Exception {
		// TODO Auto-generated method stub
		return cm.findCommsBySeller(sellid);
	}

	@Override
	public Comment findCommsByOid(int oid) throws Exception {
		// TODO Auto-generated method stub
		return cm.findCommsByOid(oid);
	}

}
