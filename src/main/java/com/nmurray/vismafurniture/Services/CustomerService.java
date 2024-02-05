package com.nmurray.vismafurniture.Services;

import com.nmurray.vismafurniture.Models.Customer;
import com.nmurray.vismafurniture.Repositories.CustomerRepository;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CustomerService {
    private final CustomerRepository customerRepository;

    public CustomerService(CustomerRepository customerRepository) {
        this.customerRepository = customerRepository;
    }

    public List<Customer> getAllCustomers() {
        return customerRepository.findAll();
    }
    public Customer getCustomerByName(String name) {
        return customerRepository.findByName(name);
    }
}
