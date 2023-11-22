package com.finalproject.team4.shouldbe.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class AdminController {
	@GetMapping("/admin")
	public String admin() {
		return "admin/admin_dashboard";
	}
	@GetMapping("/admin/reply")
	public String admin_reply() {
		return "admin/admin_reply";
	}
	@GetMapping("/admin/member/management")
	public String GoMember_management() {
		return "management/member_management";
	}
	
	@GetMapping("/admin/suspended/management")
	public String GoSuspended_management() {
		return "management/suspended_management";
	}
	
	@GetMapping("/admin/withdrawn/management")
	public String GoWithdrawn_management() {
		return "management/withdrawn_management";
	}
	
	@GetMapping("/admin/chat/management")
	public String GoChat_management() {
		return "management/chat_management";
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