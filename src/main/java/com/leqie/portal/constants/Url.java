package com.leqie.portal.constants;

public class Url {
	
	private static final String PAGE_SUFFIX = ".jhtml";
	
	private static final String AJAX_SUFFIX = ".jo";

	public static final String INDEX = "/index" + PAGE_SUFFIX;
	
	public static final String COMPANY = "/company/{child}" + PAGE_SUFFIX;
	
	public static final String LOGOUT = "/app/logout" + PAGE_SUFFIX;
	
	public static final String LOGIN = "/app/login" + PAGE_SUFFIX;
	
	public static final String FORGET = "/app/forget" + PAGE_SUFFIX;
	
	public static final String REGISTER = "/app/register" + PAGE_SUFFIX;
	
	
	public static final String LOGIN_DO = "/app/login" + AJAX_SUFFIX;
	
	public static final String REGISTER_DO = "/app/register" + AJAX_SUFFIX;
	
	public static final String FORGET_DO = "/app/forget" + AJAX_SUFFIX;
	
	public static final String SMS_DO = "/app/sms" + AJAX_SUFFIX;
	
	public static final String CHART_DATA_DO = "/chartData" + AJAX_SUFFIX;
	
	
	public static final String FAST_ORDER = "/app/fastOrder" + PAGE_SUFFIX;
	
	public static final String ORDER_INDEX = "/app/order/index" + PAGE_SUFFIX;
	
	public static final String ORDER_PAY = "/app/order/pay" + PAGE_SUFFIX;
	
	public static final String ORDER_BUY = "/app/order/buy" + PAGE_SUFFIX;
	
	public static final String ORDER_UNPAY = "/app/order/unpay" + PAGE_SUFFIX;
	
	public static final String ORDER_UNSEND = "/app/order/unsend" + PAGE_SUFFIX;
	
	public static final String ORDER_UNRECV = "/app/order/unrecv" + PAGE_SUFFIX;
	
	public static final String ORDER_FINISHED = "/app/order/finished" + PAGE_SUFFIX;
	
	public static final String ORDER_ALL = "/app/order/all" + PAGE_SUFFIX;
	
	public static final String ORDER_CANCEL = "/app/order/cancel" + AJAX_SUFFIX;
	
	public static final String ORDER_FINISH = "/app/order/finish" + AJAX_SUFFIX;
	
	
	public static final String ENTERPRISE = "/app/enterprise" + PAGE_SUFFIX;
	
	public static final String ENTERPRISE_AUTH = "/app/enterprise/auth" + PAGE_SUFFIX;
	
	
	public static final String INVOICE = "/app/invoice" + PAGE_SUFFIX;
	
	public static final String INVOICE_NEW = "/app/invoice/new" + PAGE_SUFFIX;
	
	public static final String INVOICE_UPDATE = "/app/invoice/update" + PAGE_SUFFIX;
	
	
	public static final String OVERDRAFT = "/app/overdraft" + PAGE_SUFFIX;
	
	public static final String OVERDRAFT_APPLY = "/app/overdraft/apply" + PAGE_SUFFIX;
	
	public static final String OVERDRAFT_USE_RECORD = "/app/overdraft/useRecord" + PAGE_SUFFIX;
	
	
	public static final String RECV_ADDRESS = "/app/recvAddress" + PAGE_SUFFIX;
	
	public static final String RECV_ADDRESS_NEW = "/app/recvAddress/new" + PAGE_SUFFIX;
	
	public static final String RECV_ADDRESS_UPDATE = "/app/recvAddress/update" + PAGE_SUFFIX;
	
	
	public static final String USER = "/app/user" + PAGE_SUFFIX;
	
	public static final String USER_UPDATE = "/app/user/update" + PAGE_SUFFIX;
	
	public static final String USER_UPDATE_PWD = "/app/user/updatePwd" + PAGE_SUFFIX;
	
	
	public static final String WALLET = "/app/wallet";
	
	public static final String WALLET_RECORD = "/app/wallet/record" + PAGE_SUFFIX;
	
}
