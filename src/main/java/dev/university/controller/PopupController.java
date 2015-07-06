package dev.university.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.Map;

@Controller
@RequestMapping("/popup")
public class PopupController {
	private static final String PAGE = "popup";

	@RequestMapping(method = RequestMethod.GET)
	public String popup(@RequestParam Map<String, String> allRequestParams, ModelMap model) {
		// Passing courseId.
		model.addAttribute("id", allRequestParams.get("id"));
		return PAGE;
	}
}