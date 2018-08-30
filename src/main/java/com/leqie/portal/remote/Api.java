package com.leqie.portal.remote;

import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Component;

@Component
@PropertySource("classpath:api.properties")
public class Api {
	
	public static final String SERVER_URL = "http://118.31.35.233:8999/";

	public String LOGIN = "/login";
	
	public String REGISTER = "/register";
	
	public String FORGET_PWD = "/sendMsg";
	
	public String SMS = "/user/forget";
	
	public String PRICE_LIST = "/priceList";
	
	public String PRICE_PAGE_LIST = "/pricePageList";
	
	public String UPDATE_INFO = "/user/updateUser";
	
	public String CHANGE_PWD = "/user/changePassword";
	
	public String USER_UPLOAD = "/user/upload";
	
	public String ENTERPRISE_AUTH = "/user/getRenzhengByUser";
	
	public String ENTERPRISE_SAVE_AUTH = "/user/saveRenzheng";
	
	public String ENTERPRISE_UPDATE_AUTH = "/user/updateRenzheng";
	
	
	public String PRODUCT_CATE_LIST = "/cateList";
	
	public String PRODUCT_DETAIL = "/findDetailById";
	
	public String PRODUCT_ZHENG_LIST = "/zhengbanList";
	
	public String PRODUCT_PARAMS = "/user/getByZhongleiAndXinghao";
	
	public String PRODUCT_ZHENG_LENGTH = "/getLengthByOthers";
	
	public String PRODUCT_XINGCAI_KUANDU = "/getKuanduByHoudu";
	
	public String PRODUCT_XINGCAI_HOUDU = "/getHouduByKuandu";
	
	public String PRODUCT_GUANCAI_WAIJING = "/getWaijingByNeijing";
	
	public String PRODUCT_GUANCAI_NEIJING = "/getNeijingByWaijing";
	
	
	public String ORDER_LIST = "/user/ordersList";
	
	public String ORDER_DETAIL = "/user/detailList";
	
	public String ORDER_SAVE = "/user/ordersSave";
	
	public String ORDER_MONEY = "/user/getOrderMoney";
	
	public String ORDER_CANCEL = "/user/ordersRemove";
	
	public String ORDER_FINISH = "/user/confirmComplete";
	
	
	public String SHOPCAR_INFO = "/user/countGouwucheByUser";
	
	public String SHOPCAR_LIST = "/user/getGouwucheByUser";
	
	public String SHOPCAR_ADD = "/user/saveToGouwuche";
	
	public String SHOPCAR_UPDATE = "/user/updateGouwuche";
	
	public String SHOPCAR_DELETE = "/user/deleteGouwuche";
	
	public String SHOPCAT_ORDER = "/user/saveFromGouwuche";
	
	
	public String ADDRESS_LIST = "/user/getAddressById";
	
	public String ADDRESS_NEW = "/user/saveAddress";
	
	public String ADDRESS_EDIT = "/user/updateAddress";
	
	public String ADDRESS_DEL = "/user/deleteAddress";
	
	
	public String INVOICE_INFO = "/user/getFapiaoByUser";
	
	public String INVOICE_NEW = "/user/saveFapiao";
	
	public String INVOICE_EDIT = "/user/updateFapiao";
	
	public String INVOICE_DELETE = "/user/deleteFapiao";
	
	public String INVOICE_RECORD = "/user/getkaipiaoByUser";
	
	public String INVOICE_APPLY = "/user/saveKaipiao";
	
	
	public String OVERDRAFT_INFO = "/user/getBaitiaoById";
	
	public String OVERDRAFT_SAVE = "/user/saveBaitiao";
	
	public String OVERDRAFT_UPDATE = "/user/updateBaitiao";
	
	public String OVERDRAFT_EDU = "/user/getBaitiaoEDuById";
	
	public String OVERDRAFT_BILL = "/user/baitiaoBillList";
	
	public String OVERDRAFT_PAY_LIST = "/user/baitiaoHuanKuanList";
	
	
	
}
