package com.yang.shopping.dto;

import org.springframework.http.HttpStatus;

import com.yang.shopping.model.Cart;
import com.yang.shopping.model.Delivery;
import com.yang.shopping.model.Product;
import com.yang.shopping.model.Users;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class PayDto{
	private Users users;
	private Delivery delivery;
	private Cart cart;
    private Product product;
}
