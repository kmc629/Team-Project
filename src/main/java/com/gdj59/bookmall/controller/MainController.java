package com.gdj59.bookmall.controller;

import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.log;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.gdj59.bookmall.dto.PageDTO;
import com.gdj59.bookmall.service.BookService;

@Controller
public class MainController {
	
	@Autowired
	private BookService bookService;
	
	@RequestMapping("/")
	public String main(@SessionAttribute(name = "isLogOn", required = false) Boolean myCheck, Model model) {
		System.out.println("9090909090909");
		if (myCheck == null) {
			myCheck = false;
		}
		model.addAttribute("myCheck", myCheck);
		return "main";
	}
	@GetMapping("/") 
	public String bestSeller(Model model) throws Exception {
		 model.addAttribute("bestSeller", bookService.bestSeller());
		 return "main"; 
		 }
	


}
