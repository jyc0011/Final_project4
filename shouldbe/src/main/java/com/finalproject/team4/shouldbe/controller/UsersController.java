package com.finalproject.team4.shouldbe.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class UsersController {
	@GetMapping("/login")
	public String login(HttpSession session) {
		if(session.getAttribute("LogStatus")=="Y"){
			return "redirect:/";
		}
		return "login/login_form";
	}
	
	@GetMapping("/find_id")
	public String find_id() {
		return "login/find_id";
	}
	@GetMapping("/find_pwd")
	public String find_pwd() {
		return "login/find_pwd";
	}
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
}
