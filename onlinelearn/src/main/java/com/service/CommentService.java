package com.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.bean.Comment;

public interface CommentService {
public List<Comment> listAll(Map map);
	public  void  save(Comment comment);
	public  void  detele(int comment_id);
	public  Comment  getById(int comment_id);
}
