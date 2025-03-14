package com.yang.shopping.service;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;
import java.util.Optional;
import java.util.UUID;


import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.yang.shopping.dto.ProductDto;
import com.yang.shopping.model.Cart;
import com.yang.shopping.model.FileInfo;
import com.yang.shopping.model.Product;
import com.yang.shopping.model.Users;
import com.yang.shopping.model.Wish;
import com.yang.shopping.repository.CartRepository;
import com.yang.shopping.repository.FileRepository;
import com.yang.shopping.repository.ProductRepository;
import com.yang.shopping.repository.UserRepository;
import com.yang.shopping.repository.WishRepository;

import jakarta.persistence.EntityManager;
import jakarta.persistence.Query;




/*
 * 트랜잭션 관리 때문에 서비스 단위를 사용한다.
 * 여러개 서비스(DML)를 동시에 처리할때 순차적으로 처리하기위해 트랜잭션관리가 필요하다.
*/
//service 어노테이션을 붙이면 컴포넌트 스캔을 통해 Bean에 등록을 해준다.
@Service
public class ProductService {

	@Autowired
	private ProductRepository productRepository;
	
	@Autowired
	private UserRepository userRepository;

	@Autowired
	private CartRepository cartRepository;

	@Autowired
	private WishRepository wishRepository;

	@Autowired
	private FileRepository fileRepository;
	
	@Autowired
	private EntityManager entityManager;

    // 파일 저장 경로 (예시로 "uploads" 폴더에 저장)
    private static final String UPLOAD_DIR = "E:/upload/img/";
    
	//제품 저장
	@Transactional
	public void insertAddProduct(ProductDto productDto) {
		try {
		
			productDto.getProduct().setDelYn("N");
		    Product savedProduct = productRepository.save(productDto.getProduct());  // 제품 저장

			int accessCount = 0;
	        if (!productDto.getFile().isEmpty()) {
	        	accessCount = uploadFile(productDto.getFile(), savedProduct);
	        }
			if(accessCount < 1) {System.out.println("저장된파일이 없음.");}
			
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("BoardService : 글쓰기() : "+e.getMessage());
		}
	}
	
	//제품 목록 불러오기
	@Transactional(readOnly = true)
	public Page<Product> selectProduct(String category, Pageable pageable) {
        return productRepository.findByCategory(category, pageable);
	}

	//최근에 등록한 제품 4개 불러오기
	@Transactional(readOnly = true)
	public List<Object[]> selectNewProduct() {
	    Query query = entityManager.createQuery("SELECT p, fi FROM Product p"
	    		+ " LEFT JOIN FileInfo fi ON p.productSeq = fi.product.productSeq "
 				+"AND fi.fileSeq = "
 				+ "(SELECT MAX(fi1.fileSeq) FROM FileInfo fi1 WHERE fi1.product.productSeq = p.productSeq) "
	    		+ " ORDER BY p.createDate DESC");
	    
	    // 결과 개수 제한
	    query.setMaxResults(4);

		return query.getResultList();
	}

	//수정할 제품 정보 불러오기
	@Transactional(readOnly = true)
	public Product productInfo(int id) {
		return productRepository.getProductWithFileInfo(id).orElse(null);
		//return productRepository.findById(id).orElse(null);
	}

	@Transactional
	public void insertAddCart(Cart cart, Product product, Users user) {
		try {
			Product selectProduct = productRepository.findById(product.getProductSeq()).orElseThrow();
			Users selectUser = userRepository.findById(user.getId()).orElseThrow();
			 cart.setProduct(product);
			 cart.setUser(user); 
			 cartRepository.save(cart);
		
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("BoardService : 글쓰기() : "+e.getMessage());
		}
	}

	@Transactional
	public void insertAddWish(Wish wish, Product product, Users user) {
		try {
			Optional<Wish> entity = wishRepository.customFindByWish(product.getProductSeq(), user.getId());
			if (!entity.isPresent()) {
				// 엔티티가 존재하지 않음
				Product selectProduct = productRepository.findById(product.getProductSeq()).orElseThrow();
				Users selectUser = userRepository.findById(user.getId()).orElseThrow();
				
				wish.setProduct(product);
				wish.setUser(user); 
				wish.setWishYn("Y"); 
				
				wishRepository.save(wish);
			} else {
				// 엔티티가 존재함
				System.out.println("찜하기를 이미 했습니다!!!");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("BoardService : 글쓰기() : "+e.getMessage());
		}
	}

	@Transactional
	public void deleteProduct(Product product) {
		try {
			productRepository.deleteById(product.getProductSeq());
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("ProductService : 제품삭제() : "+e.getMessage());
		}
	}
	
	@Transactional
	public void deleteAddWish(Wish wish, Product product, Users user) {
		try {
			Optional<Wish> entity = wishRepository.customFindByWish(product.getProductSeq(), user.getId());
			if (entity.isPresent()) {
				// 엔티티가 존재함
				wishRepository.deleteById(entity.get().getId());
			} else {
				// 엔티티가 존재하지 않음
				System.out.println("찜하지 않은제품입니다!!!");
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("BoardService : 글쓰기() : "+e.getMessage());
		}
	}
	

	public int uploadFile(List<MultipartFile> file, Product product) {
		try {
			int result = 0;
				for(int i=0; i<file.size(); i++) {
	            
			        // 파일 이름을 고유하게 만들기 위해 UUID 사용
			        String originalFilename = file.get(i).getOriginalFilename();
			        String uniqueFileName = UUID.randomUUID().toString() + "_" + originalFilename;
	
			        // 저장할 파일 경로
			        File destFile = new File(UPLOAD_DIR + uniqueFileName);
			        // 파일을 서버에 저장
			        FileUtils.copyInputStreamToFile(file.get(i).getInputStream(), destFile);
					System.out.println("파일명 : "+uniqueFileName);
					result++;
					FileInfo fileInfo = new FileInfo();
					fileInfo.setFileName(originalFilename);
					fileInfo.setFileSize(file.get(i).getSize());
					fileInfo.setFileType(file.get(i).getContentType());
					fileInfo.setFilePath(UPLOAD_DIR+uniqueFileName);
					fileInfo.setUuid(uniqueFileName);
					fileInfo.setProduct(product);
					
					fileRepository.save(fileInfo);
				}
	        
	        return result;
		
		} catch (IOException e) {
			e.printStackTrace();
			System.out.println("fileUpload : 파일업로드() : "+e.getMessage());
		}
		return 0;
	}
}
