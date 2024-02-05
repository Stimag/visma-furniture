package com.nmurray.vismafurniture.Controllers;

import com.nmurray.vismafurniture.Models.Order;
import com.nmurray.vismafurniture.Models.OrderDTO;
import com.nmurray.vismafurniture.Services.OrderService;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.Optional;
import java.util.UUID;

@RestController
@RequestMapping("api/orders")
public class OrderController {

    private final OrderService orderService;

    public OrderController(OrderService orderService) {
        this.orderService = orderService;
    }

    @PostMapping("/create")
    public ResponseEntity<Order> createOrder(@RequestBody OrderDTO orderDTO) {
        Order createdOrder = orderService.createOrder(orderDTO);
        return ResponseEntity.ok(createdOrder);
    }

    @GetMapping("/{OrderID}")
    public ResponseEntity<Optional<Order>> getOrderById(@PathVariable UUID OrderID) {
        Optional<Order> order = orderService.getOrderById(OrderID);
        return ResponseEntity.ok(order);
    }
}


