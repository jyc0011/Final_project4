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

}
