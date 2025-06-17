package com.yang.shopping.dto;

import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.web.multipart.MultipartFile;

import com.yang.shopping.model.Cart;
import com.yang.shopping.model.FileInfo;
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
public class ProductDto{
    private Product product;
    private List<FileInfo> fileInfo;
    private List<MultipartFile> file;
}
