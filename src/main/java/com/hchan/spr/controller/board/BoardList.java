package com.hchan.spr.controller.board;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.hchan.spr.domain.board.BoardDto;
import com.hchan.spr.domain.board.PageInfoDto;
import com.hchan.spr.domain.board.ReplyDto;
import com.hchan.spr.service.board.ListService;

@Controller
@RequestMapping("board")
public class BoardList {

	@Autowired
	private ListService listService;
	
	@GetMapping("list")
	public String showList(@RequestParam(name = "page", defaultValue = "1")int page, Model model) {
		int rowPerPage = 10;
		
		List<BoardDto> board = listService.getBoardContent(page, rowPerPage);
		int totalRecords = listService.countBoardContents();
		
		int end = (totalRecords -1) / rowPerPage + 1;
		
		PageInfoDto pageInfo = new PageInfoDto();
		pageInfo.setCurrent(page);
		pageInfo.setEnd(end);
		
		model.addAttribute("board", board);
		model.addAttribute("pageInfo", pageInfo);
		
		return "/board/list";
	}
	
	@PostMapping("list")
	public void searchList(@RequestParam(name = "page", defaultValue = "1")int page, String value, Model model) {
		int rowPerPage = 10;
		
		List<BoardDto> board = listService.searchBoardContent(value, page, rowPerPage);
		int searchedlRecords = listService.countSearchedBoardContents(value);
		int end = (searchedlRecords -1) / rowPerPage + 1;
		PageInfoDto pageInfo = new PageInfoDto();
		pageInfo.setCurrent(page);
		pageInfo.setEnd(end);
		
		model.addAttribute("board", board);
		model.addAttribute("pageInfo", pageInfo);

	}
	
	@GetMapping("post/{id}")
	public String showPost(@PathVariable("id") int id, Model model) {
		BoardDto board = listService.getPostById(id);
		List<ReplyDto> replyList = listService.getRepliesByPostId(id);
		
		model.addAttribute("board", board);
		model.addAttribute("replyList", replyList);
		
		return "/board/post";
	}
	
	@PostMapping("insert/reply")
	public String insertReply(ReplyDto reply) {
		boolean success = listService.insertReply(reply);
		
		return "redirect:/board/post/" + reply.getBoardId();
	}
	
	@GetMapping("write")
	public void writePost() {
		
	}
	
	@PostMapping("write")
	public String writePost(BoardDto board) {
		boolean success = listService.insertPost(board);
		
		return "redirect:/board/post/" + board.getId();
	}
	
	@PostMapping("modify")
	public String modifyPost(BoardDto board) {
		boolean success = listService.modifyPost(board);
		
		return "redirect:/board/post/" + board.getId();
	}
	
	@PostMapping("delete")
	public String deletePost(int id) {
		boolean success = listService.deleteBoardById(id);
		
		return "redirect:/board/list";
	}
	
	@PostMapping("reply/delete")
	public String deleteReplyById(int id, int boardId) {
		boolean success = listService.deleteReplyById(id);
		
		return "redirect:/board/post/" + boardId;
	}
	
	@PostMapping("reply/modify")
	public String modifyReplyById(ReplyDto reply, int boardId) {
		boolean success = listService.modifyReply(reply);
		
		return "redirect:/board/post/" + boardId;
	}
	
	
}














