package com.tj.mapper;

import java.util.List;

import org.springframework.stereotype.Service;

import com.tj.po.Comment;

@Service("CommentMapper")
public interface CommentMapper {

	public int add(Comment comment) throws Exception;
	
	public Comment findCommentByCid(int cid) throws Exception;
	
	public List<Comment> findCommsByHid(int hid) throws Exception;
	
	public List<Comment> findCommsBySeller(int sellid) throws Exception;
	
	public Comment findCommsByOid(int oid) throws Exception;
}
