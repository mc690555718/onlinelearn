package com.mapper;

import java.util.List;
import java.util.Map;

import com.bean.Comment;

public interface CommentMapper {
	
	public  List<Comment> listAll(Map map);
	public  void  save(Comment comment);
	public  void  detele(int comment_id);
	public  Comment  getById(int comment_id);


}
