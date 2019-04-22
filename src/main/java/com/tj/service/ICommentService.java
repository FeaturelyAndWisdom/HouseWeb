package com.tj.service;

import java.util.List;

import com.tj.po.Comment;

public interface ICommentService {
	
	public boolean save(Comment comment) throws Exception;
	
	public Comment findCommentByCid(int cid) throws Exception;
	
	public List<Comment> findCommsByHid(int hid) throws Exception;
	
	public List<Comment> findCommsBySeller(int sellid) throws Exception;
	
	public Comment findCommsByOid(int oid) throws Exception;
}
