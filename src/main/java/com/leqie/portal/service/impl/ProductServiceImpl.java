package com.leqie.portal.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;

import com.leqie.portal.constants.ResponseStatus;
import com.leqie.portal.model.Cate;
import com.leqie.portal.model.ProductZheng;
import com.leqie.portal.model.request.product.GuancaiNeijing;
import com.leqie.portal.model.request.product.GuancaiWaijing;
import com.leqie.portal.model.request.product.XingcaiHoudu;
import com.leqie.portal.model.request.product.XingcaiKuandu;
import com.leqie.portal.model.request.product.ZhengBanPage;
import com.leqie.portal.model.request.product.Zhengzhi;
import com.leqie.portal.model.response.CateResponse;
import com.leqie.portal.model.response.ProductChangdusResponse;
import com.leqie.portal.model.response.ProductResultResponse;
import com.leqie.portal.model.response.ProductZhengResponse;
import com.leqie.portal.model.response.ProductZhengsResponse;
import com.leqie.portal.service.ProductService;

@Service
public class ProductServiceImpl extends AbstarctService implements ProductService {
	
	@Override
	public List<ProductZheng> findZhengPage(ZhengBanPage request) {
		ProductZhengsResponse resp = post(API.PRODUCT_ZHENG_LIST, request, ProductZhengsResponse.class);
		if(resp != null && ResponseStatus.SUCCESS.equals(resp.getStatus())) {
			return resp.getResult();
		}
		return new ArrayList<>();
	}

	@Override
	public ProductZheng getProduct(long id) {
		ProductZhengResponse resp = 
				postOneParam(API.PRODUCT_DETAIL, "id", id, ProductZhengResponse.class);
		if(resp != null && (ResponseStatus.SUCCESS.equals(resp.getStatus()) || "200".equals(resp.getStatus()))) {
			return resp.getProduct();
		}
		return null;
	}

	@Override
	public List<Cate> findCates() {
		CateResponse resp = post(API.PRODUCT_CATE_LIST, null, CateResponse.class);
		if(resp != null && ResponseStatus.SUCCESS.equals(resp.getStatus())) {
			return resp.getList();
		}
		return new ArrayList<>();
	}

	@Override
	public List<Integer> getXingcaiHoudu(XingcaiKuandu request) {
		ProductResultResponse resp = 
				post(API.PRODUCT_XINGCAI_HOUDU, request, ProductResultResponse.class);
		if(resp != null && ResponseStatus.SUCCESS.equals(resp.getStatus())) {
			return resp.getResult();
		}
		return new ArrayList<>();
	}

	@Override
	public List<Integer> getXingcaiKuandu(XingcaiHoudu request) {
		ProductResultResponse resp = 
				post(API.PRODUCT_XINGCAI_KUANDU, request, ProductResultResponse.class);
		if(resp != null && ResponseStatus.SUCCESS.equals(resp.getStatus())) {
			return resp.getResult();
		}
		return new ArrayList<>();
	}

	@Override
	public List<Integer> getGuancaiNeijing(GuancaiWaijing request) {
		ProductResultResponse resp = 
				post(API.PRODUCT_GUANCAI_NEIJING, request, ProductResultResponse.class);
		if(resp != null && ResponseStatus.SUCCESS.equals(resp.getStatus())) {
			return resp.getResult();
		}
		return new ArrayList<>();
	}

	@Override
	public List<Integer> getGuancaiWaijing(GuancaiNeijing request) {
		ProductResultResponse resp = 
				post(API.PRODUCT_GUANCAI_WAIJING, request, ProductResultResponse.class);
		if(resp != null && ResponseStatus.SUCCESS.equals(resp.getStatus())) {
			return resp.getResult();
		}
		return new ArrayList<>();
	}

	@Override
	public List<Integer> getZhengzhi(Zhengzhi request) {
		ProductChangdusResponse resp = 
				post(API.PRODUCT_GUANCAI_NEIJING, request, ProductChangdusResponse.class);
		if(resp != null && ResponseStatus.SUCCESS.equals(resp.getStatus())) {
			return resp.getChangdus();
		}
		return new ArrayList<>();
	}

}
