package com.yang.shopping.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.yang.shopping.model.Cart;
import com.yang.shopping.model.Product;
import com.yang.shopping.model.Users;
import com.yang.shopping.model.Wish;
import com.yang.shopping.repository.CartRepository;
import com.yang.shopping.repository.ProductRepository;
import com.yang.shopping.repository.UserRepository;
import com.yang.shopping.repository.WishRepository;




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

	public void insertAddWish(Wish wish, Product product, Users user) {
		try {
			Optional<Wish> entity = wishRepository.customFindByWish(product.getProductSeq(), user.getId());
			if (!entity.isPresent()) {
				// 엔티티가 존재하지 않음
				Product selectProduct = productRepository.findById(product.getProductSeq()).orElseThrow();
				Users selectUser = userRepository.findById(user.getId()).orElseThrow();
				
				wish.setProduct(product);
				wish.setUser(user); 
				
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
