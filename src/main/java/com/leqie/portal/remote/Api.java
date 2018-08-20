package com.leqie.portal.remote;

import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Component;

@Component
@PropertySource("classpath:api.properties")
public class Api {

	public String LOGIN = "/login";
	
	public String REGISTER = "/register";
	
	public String FORGET_PWD = "/sendMsg";
	
	public String SMS = "/user/forget";
	
	public String PRICE_LIST = "/priceList";
	
	public String PRICE_PAGE_LIST = "/pricePageList";
	
	
	public String PRODUCT_CATE_LIST = "/cateList";
	
	public String PRODUCT_DETAIL = "/findDetailById";
	
	public String PRODUCT_ZHENG_LIST = "/zhengbanList";
	
	public String PRODUCT_ZHENG_LENGTH = "/getLengthByOthers";
	
	public String PRODUCT_XINGCAI_KUANDU = "/getKuanduByHoudu";
	
	public String PRODUCT_XINGCAI_HOUDU = "/getHouduByKuandu";
	
	public String PRODUCT_GUANCAI_WAIJING = "/getWaijingByNeijing";
	
	public String PRODUCT_GUANCAI_NEIJING = "/getNeijingByWaijing";
	
	
	public String ORDER_LIST = "/user/ordersList";
	
	public String ORDER_DETAIL = "/user/detailList";
	
	public String ORDER_SAVE = "/user/ordersSave";
	
	public String ORDER_MONEY = "/user/getOrderMoney";
	
	
}
