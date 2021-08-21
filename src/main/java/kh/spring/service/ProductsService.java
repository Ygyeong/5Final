package kh.spring.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kh.spring.dao.ProductsDAO;
import kh.spring.dto.ProductsDTO;

@Service
public class ProductsService {
	
	@Inject
	private ProductsDAO dao;

	public int insert(ProductsDTO dto) {
		return dao.insert(dto);
	}
	
	
	public List<ProductsDTO> selectAll(){
		return dao.selectAll();
	}

	public ProductsDTO detail(int p_seq) {
		return dao.detail(p_seq);
	}

}
