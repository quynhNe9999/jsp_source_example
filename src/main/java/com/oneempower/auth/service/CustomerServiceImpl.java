package com.oneempower.auth.service;

import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.oneempower.auth.model.Customer;
import com.oneempower.auth.repository.CustomerRepo;


@Service
public class CustomerServiceImpl implements CustomerService {
	 private final Path root = Paths.get("./uploads");

	@Autowired
	private CustomerRepo CustomerRepo;

	@Autowired
	public CustomerServiceImpl(CustomerRepo CustomerRepo) {
		this.CustomerRepo = CustomerRepo;
	}



	@Override
	public Customer insert(Customer customer) {
		return CustomerRepo.save(customer);
	}

	@Override
	public boolean delete(long id) {
		Optional<Customer> customer = CustomerRepo.findById(id);
		if (customer.isPresent()) {
			CustomerRepo.deleteById(id);
			return true;
		}
		return false;
	}



	@Override
	public Customer update(Customer customer) {
		Customer editcustomer = CustomerRepo.findById(customer.getId()).orElse(null);
		customer.setFirstname(customer.getFirstname());
		customer.setLastname(customer.getLastname());		
		customer.setEmail(customer.getEmail());
		customer.setAddress(customer.getAddress());
		return CustomerRepo.save(customer);
	}

	@Override
	public Customer findById(long id) {
		return CustomerRepo.findById(id).orElse(null);
	}

	@Override
	public Page<Customer> searchCustomer(Optional<String> keyword,Pageable pageable) {
		// TODO Auto-generated method stub
		return CustomerRepo.FindAllByfirtNameorEmailorAddress(keyword,pageable);
	}


	@Override
	public Page<Customer> findAll(Pageable pageable) {
		// TODO Auto-generated method stub
		return CustomerRepo.findAll(pageable);
	}



}
