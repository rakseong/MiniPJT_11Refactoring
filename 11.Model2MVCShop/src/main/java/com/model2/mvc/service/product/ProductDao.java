package com.model2.mvc.service.product;

import java.util.List;

import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Product;

public interface ProductDao {

	//��ǰ ���� ��ȸ
	public Product getProduct(int productNo) throws Exception;
	
	//��ǰ ���
	public List<Object> getProductList(Search search) throws Exception;
	
	//��ǰ ���
	public void addProduct(Product product) throws Exception;
	
	//��ǰ ���� ����
	public void updateProduct(Product product) throws Exception;
	
	//�˻��� record ����
	public int getTotalCount(Search search) throws Exception;
	
	public List<String> getAllProdList(Search search) throws Exception;
}
