package com.nmurray.vismafurniture.Models;

import lombok.Getter;
import lombok.Setter;

import java.util.List;

@Getter
@Setter
public class OrderDTO {
    private String customerName;
    private List<String> products;
}

