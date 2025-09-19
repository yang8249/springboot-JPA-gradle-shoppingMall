package com.yang.shopping.dto;

import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.web.multipart.MultipartFile;

import com.yang.shopping.model.Cart;
import com.yang.shopping.model.Delivery;
import com.yang.shopping.model.FileInfo;
import com.yang.shopping.model.Product;
import com.yang.shopping.model.ReturnDelivery;
import com.yang.shopping.model.Users;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class ReturnDto{
    private ReturnDelivery returnDelivery;
    private Users users;
    private Delivery delivery;
    private List<MultipartFile> file;
}
