package com.finalproject.team4.shouldbe.controller;

import com.finalproject.team4.shouldbe.service.AdminService;
import com.finalproject.team4.shouldbe.service.UserService;
import com.finalproject.team4.shouldbe.vo.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
public class AdminController {
	@Autowired
	AdminService service;
	@GetMapping("/admin")
	public String admin() {
		return "admin/admin_dashboard";
	}
	@GetMapping("/admin/reply")
	public String admin_reply() {
		return "admin/admin_reply";
	}
	@GetMapping("/admin/board")
	public ModelAndView admin_board(@RequestParam(required = false, defaultValue = "1") int page) {
		ModelAndView mav = new ModelAndView("admin/admin_board");
		PagingVO pvo = new PagingVO();
		pvo.setOnePageRecord(10);
		pvo.setPage(page);
		pvo.setTotalRecord(service.totalBoardRecord());
		List<BoardVO> board = service.getSaveMessageList(pvo);
		mav.addObject("board", board);
		mav.addObject("pVO", pvo);
		return mav;
	}
	@GetMapping("/admin/member/management")
	public ModelAndView GoMember_management() {
		ModelAndView mav=new ModelAndView();
		List<AdminMemberVO> amlist=service.adminMemberList();
		mav.addObject("amlist", amlist);
		mav.setViewName("management/member_management");
		return mav;
	}
	
	@GetMapping("/admin/suspended/management")
	public ModelAndView GoSuspended_management() {
		ModelAndView mav=new ModelAndView();
		List<AdminSuspendedVO> aslist=service.adminSuspendedList();
		mav.addObject("aslist", aslist);
		mav.setViewName("management/suspended_management");
		return mav;
	}
	
	@GetMapping("/admin/withdrawn/management")
	public ModelAndView GoWithdrawn_management() {
		ModelAndView mav=new ModelAndView();
		List<AdminWithdrawnVO> awlist=service.adminWithdrawnList();
		mav.addObject("awlist", awlist);
		mav.setViewName("management/withdrawn_management");
		return mav;
	}
	
	@GetMapping("/admin/chat/management")
	public ModelAndView GoChat_management() {
		ModelAndView mav=new ModelAndView();
		List<AdminChatVO> aclist=service.adminChatList();
		mav.addObject("aclist", aclist);
		mav.setViewName("management/chat_management");
		return mav;
	}
	
	@GetMapping("/admin/quiz/list")
	public String GoQuiz_list() {
		return "quiz_management/quiz_list";
	}
	@GetMapping("/admin/quiz/reg_manager")
	public String GoQuiz_reg_manager() {
		return "quiz_management/quiz_reg_manager";
	}
	
	@GetMapping("/admin/quiz/reg_user")
	public String GoQuiz_reg_user() {
		return "quiz_management/quiz_reg_user";
	}
	
	@GetMapping("/admin/quiz_edit")
	public String GoQuiz_edit() {
		return "quiz_management/quiz_edit";
	}
}