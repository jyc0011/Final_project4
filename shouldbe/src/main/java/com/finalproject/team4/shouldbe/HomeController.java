package com.finalproject.team4.shouldbe;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class HomeController {
	@RequestMapping("/")
	public String Home() {
		return "home";
	}
	@GetMapping("/header")
	public String admin() {
		return "header";
	}

	@RequestMapping("/log")
	public String home(HttpSession session) {
		//자동로그인용 나중에 지워야함
		session.setAttribute("logId", "helloworld2");
		session.setAttribute("logStatus","Y");
		return "home";
	}
}
