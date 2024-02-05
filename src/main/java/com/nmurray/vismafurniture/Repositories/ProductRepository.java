package com.nmurray.vismafurniture.Repositories;

import com.nmurray.vismafurniture.Models.Product;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.UUID;

@Repository
public interface ProductRepository extends JpaRepository<Product, UUID> {
    List<Product> findAll();

    List<Product> findByCategory(String category);

    Product findByName(String name);
}