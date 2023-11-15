package com.finalproject.team4.shouldbe.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class AdminController {
	@GetMapping("/admin")
	public String admin() {
		return "admin/admin_dashboard";
	}
	@GetMapping("/admin_reply")
	public String admin_reply() {
		return "admin/admin_reply";
	}
}
