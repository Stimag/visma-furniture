package com.nmurray.vismafurniture.Services;

import com.nmurray.vismafurniture.Models.Customer;
import com.nmurray.vismafurniture.Models.Order;
import com.nmurray.vismafurniture.Models.OrderDTO;
import com.nmurray.vismafurniture.Models.Product;
import com.nmurray.vismafurniture.Repositories.CustomerRepository;
import com.nmurray.vismafurniture.Repositories.OrderRepository;
import com.nmurray.vismafurniture.Repositories.ProductRepository;
import org.springframework.stereotype.Service;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import java.util.UUID;

@Service
public class OrderService {
    private final OrderRepository orderRepository;
    private final ProductRepository productRepository;
    private final CustomerRepository customerRepository;

    public OrderService(OrderRepository orderRepository,
                        ProductRepository productRepository,
                        CustomerRepository customerRepository) {
        this.orderRepository = orderRepository;
        this.productRepository = productRepository;
        this.customerRepository = customerRepository;
    }

    public Order createOrder(OrderDTO orderDTO) {
        if (orderDTO.getProducts().isEmpty()) {
            throw new IllegalArgumentException("Order is invalid");
        }

        LocalDateTime now = LocalDateTime.now();

        // Get customer name from name field on website
        String customerName = orderDTO.getCustomerName();

        // Check that the customer is in database
        Optional<Customer> customerOptional = Optional.ofNullable(customerRepository.findByName(customerName));
        if (customerOptional.isEmpty()) {
            throw new IllegalArgumentException("Customer not found with name: " + customerName);
        }
        Customer customer = customerOptional.get();

        // Get list of products from the cart on the website
        List<String> productsInCart = orderDTO.getProducts();

        // Create list of products from products in cart, as long as the names are in the database
        List<Product> products = fetchProductsByNames(productsInCart);

        double totalPrice = calculateTotalPrice(products, customer);

        Order order = new Order();
        order.setOrderDate(LocalDate.from(now));
        order.setTotalPrice(totalPrice);
        order.setCustomer(customer);
        order.setProducts(productsInCart);

        return orderRepository.save(order);
    }

    private List<Product> fetchProductsByNames(List<String> productNames) {
        List<Product> products = new ArrayList<>();
        for (String productName : productNames) {
            Optional<Product> productOptional = Optional.ofNullable(productRepository.findByName(productName));
            productOptional.ifPresent(products::add);
        }
        return products;
    }

    private double calculateTotalPrice(List<Product> products, Customer customer) {
        double totalPrice = 0.0;

        for (Product product : products) {
            double itemPrice = product.getPrice();
            double discountedPrice = applyDiscount(itemPrice, customer, product);
            totalPrice += discountedPrice;
        }

        return totalPrice;
    }

    private double applyDiscount(double productPrice, Customer customer, Product product) {
        List<String> categories = new ArrayList<>();
        categories.add("furniture");
        categories.add("food");
        String orderedProductsCategory = product.getCategory();

        if (customer != null && customer.isMember() && categories.contains(orderedProductsCategory.toLowerCase())) {
            double discount = 0.10;
            return productPrice - (productPrice * discount);
        }

        return productPrice;
    }

    public Optional<Order> getOrderById(UUID orderId) {
        return orderRepository.findById(orderId);
    }
}
