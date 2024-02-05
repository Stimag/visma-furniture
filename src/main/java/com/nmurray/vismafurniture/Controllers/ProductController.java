package com.nmurray.vismafurniture.Controllers;

import com.nmurray.vismafurniture.Models.Product;
import com.nmurray.vismafurniture.Services.ProductService;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping("/api/products")
public class ProductController {
    private final ProductService productService;

    public ProductController(ProductService productService) {
        this.productService = productService;
    }

    @GetMapping
    public ResponseEntity<List<Product>> getAllProducts() {
        List<Product> products = productService.getAllProducts();
        return ResponseEntity.ok(products);
    }

    @GetMapping(params = "category")
    public ResponseEntity<List<Product>> getProductsByCategory(@RequestParam String category) {
        List<Product> products = productService.getProductsByCategory(category);
        return ResponseEntity.ok(products);
    }

    @GetMapping("description/{productName}")
    public ResponseEntity<String> getProductDescription(@PathVariable String productName) {
        String description = productService.getProductDescription(productName);
        return ResponseEntity.ok(description);
    }

    @GetMapping("price/{productName}")
    public ResponseEntity<Optional<Double>> getProductPrice(@PathVariable String productName) {
        Optional<Double> price = productService.getProductPrice(productName);
        return ResponseEntity.ok(price);
    }
}