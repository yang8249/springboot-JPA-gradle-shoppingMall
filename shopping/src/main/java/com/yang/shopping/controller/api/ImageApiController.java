package com.yang.shopping.controller.api;

import java.io.IOException;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.security.Principal;
import java.text.NumberFormat;
import java.util.List;
import java.util.Locale;

import org.apache.tomcat.util.file.ConfigurationSource.Resource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.UrlResource;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.data.web.PageableDefault;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.yang.shopping.config.auth.PrincipalDetail;
import com.yang.shopping.dto.CartDto;
import com.yang.shopping.dto.ProductDto;
import com.yang.shopping.dto.ResponseDto;
import com.yang.shopping.dto.WishDto;
import com.yang.shopping.model.Board;
import com.yang.shopping.model.Cart;
import com.yang.shopping.model.Product;
import com.yang.shopping.model.Users;
import com.yang.shopping.service.ProductService;

import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpSession;

@RestController
@RequestMapping("/upload/img")
public class ImageApiController {

    private static final String IMAGE_DIR = "E:/upload/img/";
	
	//이미지 파일 이진데이터 호출하는 로직
	/* JSP에서 img태그가 로드되면 "/upload/img/{파일명}"에 맞춰서 컨트롤러를 진입한다.
	 * 아래 컨트롤러에서 파일명에 맞는 파일을 찾아온 다음 이진데이터로 반환하고
	 * 반환된 이진데이터를 img태그의 src로 대입해서 이미지 호출하는 형식이다.
	*/
	@GetMapping("/{filename}")
	public ResponseEntity<UrlResource> getImage(@PathVariable String filename) throws IOException {
	    Path path = Paths.get(IMAGE_DIR + filename);
	    UrlResource resource = new UrlResource(path.toUri());

	    if (!resource.exists() || !resource.isReadable()) {
	        return ResponseEntity.notFound().build();
	    }

	    String extension = filename.substring(filename.lastIndexOf(".") + 1).toLowerCase();
	    MediaType mediaType = switch (extension) {
	        case "jpg", "jpeg" -> MediaType.IMAGE_JPEG;
	        case "png" -> MediaType.IMAGE_PNG;
	        case "gif" -> MediaType.IMAGE_GIF;
	        default -> MediaType.APPLICATION_OCTET_STREAM; // 파일 형식이 알 수 없을 경우
	    };

	    return ResponseEntity.ok()
	            .contentType(mediaType) // 확장자에 맞는 MIME 타입 설정
	            .body(resource);  // 이미지 이진 데이터 전송
	}
	
}