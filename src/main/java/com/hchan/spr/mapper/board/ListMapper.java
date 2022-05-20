package com.hchan.spr.mapper.board;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.hchan.spr.domain.board.BoardDto;
import com.hchan.spr.domain.board.ReplyDto;

public interface ListMapper {

	List<BoardDto> selectBoardContent(@Param("from") int from, @Param("row") int row);

	BoardDto getPostById(int id);

	List<ReplyDto> getRepliesByPostId(int id);

	int insertReply(ReplyDto reply);

	int insertPost(BoardDto board);

	int updatePost(BoardDto board);

	int deleteReplyById(int id);
	
	int deleteReplyByBoardId(int id);

	int deleteBoardById(int id);

	int updateReplyById(ReplyDto reply);

	List<BoardDto> selectSearchedBoardContent(@Param("value") String value, @Param("from") int from, @Param("row") int row);

	int countBoardContents();

	int countSearchedBoardContents(@Param("value") String value);
	
	

}
