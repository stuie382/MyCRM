package com.stuart.mycrm.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.stuart.mycrm.dao.CustomerDAO;
import com.stuart.mycrm.entity.Customer;

@Service
public class CustomerServiceImpl implements CustomerService {

	private final CustomerDAO customerDAO;

	@Autowired
	public CustomerServiceImpl(CustomerDAO customerDAO) {
		this.customerDAO = customerDAO;
	}

	@Override
	@Transactional
	public List<Customer> getCustomers() {
		return customerDAO.getCustomers();
	}

	@Override
	@Transactional
	public void saveCustomer(final Customer customer) {

		customerDAO.saveCustomer(customer);
	}

	@Override
	@Transactional
	public Customer getCustomer(final int id) {
		return customerDAO.getCustomer(id);
	}

	@Override
	@Transactional
	public void deleteCustomer(final int id) {
		
		customerDAO.deleteCustomer(id);
	}

	@Override
	@Transactional
	public List<Customer> searchCustomers(final String searchName) {

		return customerDAO.searchCustomers(searchName);
	}

}





