package com.stuart.mycrm.service;

import java.util.List;

import com.stuart.mycrm.entity.Customer;

public interface CustomerService {

	List<Customer> getCustomers();

	void saveCustomer(final Customer customer);

	Customer getCustomer(final int theId);

	void deleteCustomer(final int theId);

	List<Customer> searchCustomers(final String searchName);
	
}
