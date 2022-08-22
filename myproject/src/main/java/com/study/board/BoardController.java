package com.study.board;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class BoardController {
	
	@Inject
	IBoardService service;

	@RequestMapping(value = "/board/boardList.wow")
	 public String boardMain(Model model, @ModelAttribute("searchVO") BoardSerchVO searchVO) {
	  List<BoardVO> boardList = service.getBoardList(searchVO);
	  model.addAttribute("boardList", boardList);
	  return "board/boardList";
	 }
	
	//내가 쓴 글
	@RequestMapping(value = "/member/myboard.wow")
	public String myboard(Model model, String boMemId) {
		List<BoardVO> boardList = service.getmyBoard(boMemId);
		model.addAttribute("boardList", boardList);
		return "member/myboard";
	}
	
	@RequestMapping(value = "/board/boardView.wow")
	public String boardView(Model model, int boNo) {
		BoardVO board = service.getBoard(boNo);
		service.addHit(boNo);
		model.addAttribute("board", board);
		return "board/boardView";
	}
	
	@RequestMapping(value = "/board/boardForm.wow")
	public String boardForm(Model model, @ModelAttribute("board") BoardVO board) {
		return "board/boardForm";
	}
	
	@RequestMapping(value = "/board/boardRegist.wow")
	public ModelAndView boardRegist(Model model, @ModelAttribute("board") BoardVO board)
	throws Exception{
		ModelAndView mavAndView = new ModelAndView("redirect:/board/boardList.wow");
		service.insertBoard(board);		
		return mavAndView;
	}
	
	@RequestMapping(value = "/board/boardEdit.wow")
	public String boardEdit(Model model, int boNo) {
		BoardVO board = service.getBoard(boNo);
		model.addAttribute("board", board);
		return "board/boardEdit";
	}
	
	@PostMapping(value = "/board/boardModify.wow")
	public ModelAndView boardModify(Model model, @ModelAttribute("board") BoardVO board){
		ModelAndView mavAndView = new ModelAndView("redirect:boardView.wow?boNo="+board.getBoNo());
		service.updateBoard(board);		
		return mavAndView;
	}
	
	@RequestMapping(value = "/board/boardDelete.wow")
	public ModelAndView boardDelete(Model model, int boNo){
		ModelAndView mavAndView = new ModelAndView("redirect:boardList.wow");
		service.deleteBoard(boNo);
		return mavAndView;
	}

}
