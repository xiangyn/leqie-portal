package com.leqie.portal.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.leqie.portal.constants.ResponseStatus;
import com.leqie.portal.model.Cate;
import com.leqie.portal.model.Page;
import com.leqie.portal.model.ProductZheng;
import com.leqie.portal.model.request.product.GuancaiNeijing;
import com.leqie.portal.model.request.product.GuancaiWaijing;
import com.leqie.portal.model.request.product.XingcaiHoudu;
import com.leqie.portal.model.request.product.XingcaiKuandu;
import com.leqie.portal.model.request.product.ZhengBanPage;
import com.leqie.portal.model.request.product.Zhengzhi;
import com.leqie.portal.model.response.CateResponse;
import com.leqie.portal.model.response.ListResponse;
import com.leqie.portal.model.response.ProductParamsResponse;
import com.leqie.portal.model.response.ProductResultResponse;
import com.leqie.portal.model.response.ProductZhengResponse;
import com.leqie.portal.service.ProductService;

@Service
public class ProductServiceImpl extends AbstarctService implements ProductService {
	
	public static class ProductZhengsResponse extends ListResponse<ProductZheng> { }
	
	@Override
	public Page<ProductZheng> findZhengPage(ZhengBanPage page) {
		ProductZhengsResponse resp = post(API.PRODUCT_ZHENG_LIST, page, ProductZhengsResponse.class);
		if(resp != null && ResponseStatus.SUCCESS.equals(resp.getStatus())) {
			return new Page<ProductZheng>(page, resp);
		}
		return new Page<>();
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
	public List<Float> getXingcaiHoudu(XingcaiKuandu request) {
		ProductResultResponse resp = 
				post(API.PRODUCT_XINGCAI_HOUDU, request, ProductResultResponse.class);
		if(resp != null && ResponseStatus.SUCCESS.equals(resp.getStatus())) {
			return resp.getResult();
		}
		return new ArrayList<>();
	}

	@Override
	public List<Float> getXingcaiKuandu(XingcaiHoudu request) {
		ProductResultResponse resp = 
				post(API.PRODUCT_XINGCAI_KUANDU, request, ProductResultResponse.class);
		if(resp != null && ResponseStatus.SUCCESS.equals(resp.getStatus())) {
			return resp.getResult();
		}
		return new ArrayList<>();
	}

	@Override
	public List<Float> getGuancaiNeijing(GuancaiWaijing request) {
		ProductResultResponse resp = 
				post(API.PRODUCT_GUANCAI_NEIJING, request, ProductResultResponse.class);
		if(resp != null && ResponseStatus.SUCCESS.equals(resp.getStatus())) {
			return resp.getResult();
		}
		return new ArrayList<>();
	}

	@Override
	public List<Float> getGuancaiWaijing(GuancaiNeijing request) {
		ProductResultResponse resp = 
				post(API.PRODUCT_GUANCAI_WAIJING, request, ProductResultResponse.class);
		if(resp != null && ResponseStatus.SUCCESS.equals(resp.getStatus())) {
			return resp.getResult();
		}
		return new ArrayList<>();
	}

	@Override
	public List<Float> getZhengzhi(Zhengzhi request) {
		ProductParamsResponse resp = 
				post(API.PRODUCT_GUANCAI_NEIJING, request, ProductParamsResponse.class);
		if(resp != null && ResponseStatus.SUCCESS.equals(resp.getStatus())) {
			return resp.getChangdus();
		}
		return new ArrayList<>();
	}

	@Override
	public ProductParamsResponse getParams(String zhonglei, String xinghaoId) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("zhonglei", zhonglei);
		params.put("xinghao", xinghaoId);
		ProductParamsResponse resp = 
				post(API.PRODUCT_PARAMS, params, ProductParamsResponse.class);
		if(resp != null && ResponseStatus.SUCCESS.equals(resp.getStatus())) {
			return resp;
		}
		return null;
	}

}
