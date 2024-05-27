package com.oneempower.auth.service;

import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.oneempower.auth.model.Customer;

@Service
public interface CustomerService {


	Customer insert(Customer customer);

	boolean delete(long id);

	Customer update(Customer customer);

	Customer findById(long id);

	Page<Customer> searchCustomer(Optional<String> keyword, Pageable pageable);

	Page<Customer> findAll(Pageable pageable);




}