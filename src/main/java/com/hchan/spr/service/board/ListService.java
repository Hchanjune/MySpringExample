package com.hchan.spr.service.board;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.hchan.spr.domain.board.BoardDto;
import com.hchan.spr.domain.board.ReplyDto;
import com.hchan.spr.mapper.board.ListMapper;

@Service
public class ListService {

	@Autowired
	private ListMapper mapper;

	public List<BoardDto> getBoardContent(int page, int rowPerPage) {
		
		int from = (page-1) * rowPerPage;
		
		return mapper.selectBoardContent(from, rowPerPage);
	}

	public BoardDto getPostById(int id) {
		
		return mapper.getPostById(id);
	}

	public List<ReplyDto> getRepliesByPostId(int id) {
		
		return mapper.getRepliesByPostId(id);
	}

	public boolean insertReply(ReplyDto reply) {
		
		return mapper.insertReply(reply) == 1;
	}

	public boolean insertPost(BoardDto board) {
		
		return mapper.insertPost(board) == 1;
	}

	public boolean modifyPost(BoardDto board) {
		
		return mapper.updatePost(board) == 1;
	}
	
	public boolean deleteReplyById(int id) {
		
		return mapper.deleteReplyById(id) == 1;
	}

	@Transactional
	public boolean deleteBoardById(int id) {
		
		mapper.deleteReplyByBoardId(id);
		
		return mapper.deleteBoardById(id) == 1;
	}

	public boolean modifyReply(ReplyDto reply) {
		
		return mapper.updateReplyById(reply) == 1;
	}

	public List<BoardDto> searchBoardContent(String value, int page, int rowPerPage) {
		String str = "%" + value + "%";
		int from = (page-1) * rowPerPage;
		return mapper.selectSearchedBoardContent(str, from, rowPerPage);
	}

	public int countBoardContents() {
		
		return mapper.countBoardContents();
	}

	public int countSearchedBoardContents(String value) {
		return mapper.countSearchedBoardContents(value);
	}

}
