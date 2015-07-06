package dev.university.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/")
public class MainController {
	private static final String PAGE = "main";

	@RequestMapping(method = RequestMethod.GET)
	public String main(ModelMap model) {
		return PAGE;
	}
}