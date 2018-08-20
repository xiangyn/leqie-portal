package com.leqie.portal.service;

import java.util.List;

import com.leqie.portal.model.Cate;
import com.leqie.portal.model.ProductZheng;
import com.leqie.portal.model.request.product.GuancaiNeijing;
import com.leqie.portal.model.request.product.GuancaiWaijing;
import com.leqie.portal.model.request.product.XingcaiHoudu;
import com.leqie.portal.model.request.product.XingcaiKuandu;
import com.leqie.portal.model.request.product.ZhengBanPage;
import com.leqie.portal.model.request.product.Zhengzhi;

public interface ProductService {

	ProductZheng getProduct(long id);
	
	List<Cate> findCates();
	
	List<ProductZheng> findZhengPage(ZhengBanPage request);
	
	List<Integer> getXingcaiHoudu(XingcaiKuandu request);
	
	List<Integer> getXingcaiKuandu(XingcaiHoudu request);
	
	List<Integer> getGuancaiNeijing(GuancaiWaijing request);
	
	List<Integer> getGuancaiWaijing(GuancaiNeijing request);
	
	List<Integer> getZhengzhi(Zhengzhi request);
	
}
