package com.service;

import java.util.List;
import java.util.Map;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bean.Comment;
import com.mapper.CommentMapper;
@Service
public class CommentServiceImpl implements CommentService {
	@Autowired
	private CommentMapper CommentMapper;
	@Override
	public List<Comment> listAll(Map map) {
		List<Comment> list=CommentMapper.listAll(map);
		return list;
	}

	@Override
	public void save(Comment comment) {
		CommentMapper.save(comment);
	}

	@Override
	public void detele(int comment_id) {
		CommentMapper.detele(comment_id);

	}

	@Override
	public Comment getById(int comment_id) {
		return CommentMapper.getById(comment_id);
	}

	@Override
	public List<Comment> listComment(int other_id) {
		List<Comment> listAll=CommentMapper.listComment(other_id);
		return listAll;
	}

	@Override
	public void praiseEdit(int comment_id) {
		// TODO Auto-generated method stub
		CommentMapper.praiseEdit(comment_id);
	}

	@Override
	public List<Comment> childComment(Map map) {
		List<Comment> list=CommentMapper.childComment(map);
		return list;
	}

	@Override
	public void addcomment(int comment_id) {
		// TODO Auto-generated method stub
		CommentMapper.addcomment(comment_id);
	}

	@Override
	public void addNum(int other_id) {
		// TODO Auto-generated method stub
		CommentMapper.addNum(other_id);
	}

	@Override
	public List<Comment> selectId(int comment_id) {
		List<Comment> lists=CommentMapper.selectId(comment_id);
		return lists;
	}






	
	
}
