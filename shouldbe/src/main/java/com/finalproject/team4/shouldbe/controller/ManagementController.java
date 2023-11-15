package com.finalproject.team4.shouldbe.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ManagementController {
	@GetMapping("/member_management")
	public String GoMember_management() {
		return "management/member_management";
	}
	
	@GetMapping("/suspended_management")
	public String GoSuspended_management() {
		return "management/suspended_management";
	}
}
