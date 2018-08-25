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
import com.leqie.portal.model.response.ProductParamsResponse;

public interface ProductService {

	ProductZheng getProduct(long id);
	
	List<Cate> findCates();
	
	ProductParamsResponse getParams(String zhonglei, String xinghaoId); 
	
	List<ProductZheng> findZhengPage(ZhengBanPage request);
	
	List<Float> getXingcaiHoudu(XingcaiKuandu request);
	
	List<Float> getXingcaiKuandu(XingcaiHoudu request);
	
	List<Float> getGuancaiNeijing(GuancaiWaijing request);
	
	List<Float> getGuancaiWaijing(GuancaiNeijing request);
	
	List<Float> getZhengzhi(Zhengzhi request);
	
}
