package com.nmurray.vismafurniture.Controllers;

import com.nmurray.vismafurniture.Models.Customer;
import com.nmurray.vismafurniture.Services.CustomerService;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/api/customers")
public class CustomerController {
    private final CustomerService customerService;

    public CustomerController(CustomerService customerService) {
        this.customerService = customerService;
    }

    @GetMapping
    public ResponseEntity<List<Customer>> getAllCustomers() {
        List<Customer> customers = customerService.getAllCustomers();
        return ResponseEntity.ok(customers);
    }

    @GetMapping("/{customerName}")
    public ResponseEntity<String> getCustomerName(@PathVariable String customerName) {
        String name = String.valueOf(customerService.getCustomerByName(customerName));
        return ResponseEntity.ok(name);
    }
}
