package com.yang.shopping.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.yang.shopping.model.Product;
import com.yang.shopping.repository.ProductRepository;




/*
 * 트랜잭션 관리 때문에 서비스 단위를 사용한다.
 * 여러개 서비스(DML)를 동시에 처리할때 순차적으로 처리하기위해 트랜잭션관리가 필요하다.
*/
//service 어노테이션을 붙이면 컴포넌트 스캔을 통해 Bean에 등록을 해준다.
@Service
public class ProductService {

	@Autowired
	private ProductRepository productRepository;
	

	//제품 목록 불러오기
	@Transactional(readOnly = true)
	public Page<Product> selectProduct(String category, Pageable pageable) {
        return productRepository.findByCategory(category, pageable);
	}

	//최근에 등록한 제품 4개 불러오기
	public List<Product> selectNewProduct() {
		// TODO Auto-generated method stub
		return productRepository.findByNewProduct();
	}

	//수정할 제품 정보 불러오기
	public Product productInfo(int id) {
		return productRepository.findById(id).orElse(null);
	}
	
	/*
	 * //이 트랜잭션 어노테이션으로 해당 서비스를 하나의 트랜잭션 단위로 묶었다.
	 * 
	 * @Transactional public void saveContent(Product product, Users user) { try {
	 * product.setUser(user); productRepository.save(product); } catch (Exception e)
	 * { e.printStackTrace();
	 * System.out.println("ProductService : 글쓰기() : "+e.getMessage()); } }
	 * 
	 * //상세보기 select
	 * 
	 * @Transactional(readOnly = true) public Product productDetail(int id) { return
	 * productRepository.findById(id) .orElseThrow(()->{ return new
	 * IllegalArgumentException("글 상세보기 실패 : 아이디를 찾을수 없습니다."); }) ; }
	 * 
	 * //글 삭제하기
	 * 
	 * @Transactional public void deleteProduct(int id) {
	 * productRepository.deleteById(id); }
	 * 
	 * //전체 글 불러오기
	 * 
	 * @Transactional(readOnly = true) public Page<Product>
	 * selectAllProduct(Pageable pageable) { return
	 * productRepository.findAll(pageable); }
	 * 
	 * //글 수정하기
	 * 
	 * @Transactional public void updateProduct(int id, Product product) { Product
	 * PersistenceProduct = productRepository.findById(id).orElseThrow(()->{ return
	 * new IllegalArgumentException("글 수정 실패 : 아이디를 찾을 수 없음."); }); //select하여 영속화
	 * 한다.
	 * 
	 * PersistenceProduct.setTitle(product.getTitle());
	 * PersistenceProduct.setContent(product.getContent()); //영속화 후 set해주면
	 * 함수(service)종료 시 트랜잭션이 종료된다. //이때에 더티체킹(영속 컨테이너와 DB와 비교)하여 자동 업뎃이 된다. }
	 */

	
	
}
