package com.oneempower.auth.web;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.oneempower.auth.model.Customer;
import com.oneempower.auth.repository.CustomerRepo;
import com.oneempower.auth.service.CustomerService;

@Controller
public class CustomerController {

	@Autowired
	private CustomerService customerService;

	private final CustomerRepo customerRepo;

	CustomerController(CustomerRepo customerRepo) {
		this.customerRepo = customerRepo;
	}

	
//hien thị sv
	@GetMapping("/customer")
	public ModelAndView home(@RequestParam(name = "keyword") Optional<String> keyword,
			@RequestParam(defaultValue = "0") int page,  @RequestParam(defaultValue = "5") int size, Model model
			) throws IOException {
		Pageable pageable = PageRequest.of(page, size);
		Page<Customer> listUsers;
		// = userService.getAllUser(page,size);
		// tìm kiếm
		if (keyword.isPresent()) {
			listUsers = customerService.searchCustomer(keyword, pageable);

			// listUsers = userService.findAllByFirstNameContaining(firstName.get(),
			// pageable);
		} else {
			listUsers = customerService.findAll(pageable);
		}
		Map<String, Object> modelMap = new HashMap<>();
		modelMap.put("data", listUsers);
		return new ModelAndView("customer", modelMap);
	}

	// them sv
	@GetMapping("/addCustomer")
	public String viewaddCustomer() {
		return "addCustomer";
	}

	@PostMapping("/insertCustomer")
	public String insertCustomer(@ModelAttribute("insertCustomer") Customer customer) {

		customerService.insert(customer);
		return "redirect:/customer";
	}

	// update sv
	@PostMapping("/editCustomer/updateCustomer")
	public String updateCustomer(@ModelAttribute("customer") Customer customer) {

		customerService.update(customer);
		return "redirect:/customer";
	}

	@GetMapping("/editCustomer/{id}")
	public String viewupdateCustomer(@PathVariable("id") Long id, Customer Customer, Model model) {

		model.addAttribute("Customer", customerService.findById(id));
		return "updateCustomer";

	}

	// xoa sv
	@GetMapping("/deleteCustomer/{id}")
	public String deleteCustomer(@PathVariable("id") Long id) {
		customerService.delete(id);
		return "redirect:/customer";
	}

}
