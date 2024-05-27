package com.oneempower.auth.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MainController {




	// them sv
	@GetMapping("/app")
	public String viewaddCustomer() {
		return "_app";
	}

	

}
