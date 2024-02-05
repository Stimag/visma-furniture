package com.nmurray.vismafurniture.Repositories;

import com.nmurray.vismafurniture.Models.Customer;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;
import java.util.UUID;

public interface CustomerRepository extends JpaRepository<Customer, UUID> {
    List<Customer> findAll();
    Customer findByName(String name);
}
