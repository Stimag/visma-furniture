package com.nmurray.vismafurniture.Services;

import com.nmurray.vismafurniture.Models.Product;
import com.nmurray.vismafurniture.Repositories.ProductRepository;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class ProductService {
    private final ProductRepository productRepository;

    public ProductService(ProductRepository productRepository) {
        this.productRepository = productRepository;
    }

    public List<Product> getAllProducts() {
        return productRepository.findAll();
    }

    public List<Product> getProductsByCategory(String category) {
        return productRepository.findByCategory(category);
    }

    public String getProductDescription(String productName) {
        Product product = productRepository.findByName(productName);
        return product != null ? product.getDescription() : "Product not found";
    }

    public Optional<Double> getProductPrice(String productName) {
        Product product = productRepository.findByName(productName);
        return product != null ? Optional.of(product.getPrice()) : Optional.empty();
    }
}

