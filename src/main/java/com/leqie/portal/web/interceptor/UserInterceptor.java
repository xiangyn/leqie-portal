package com.leqie.portal.web.interceptor;

import java.nio.charset.Charset;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.catalina.util.URLEncoder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.leqie.portal.constants.RequestAttributes;
import com.leqie.portal.constants.Session;
import com.leqie.portal.controller.ShopCarInfo;
import com.leqie.portal.model.User;
import com.leqie.portal.service.ShoppingCarService;
import com.leqie.portal.utils.WebUtil;

public class UserInterceptor implements HandlerInterceptor {
	
	private String redirectUrl;
	
	private Charset charset;
	
	public String getRedirectUrl() {
		return redirectUrl;
	}

	public void setRedirectUrl(String redirectUrl) {
		this.redirectUrl = redirectUrl;
	}

	public Charset getCharset() {
		return charset;
	}

	public void setCharset(Charset charset) {
		this.charset = charset;
	}
	
	@Autowired
	private ShoppingCarService shopcarService;

	@Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
            throws Exception {
        User user = WebUtil.getUser(request);
        if (user == null) {
        	String rediect = getRedirectUrl(request);
            response.sendRedirect(rediect);
            return false;
        }
        return true;
    }
	
	protected String getRedirectUrl(HttpServletRequest request) {
		int port = request.getServerPort();
		String redirectParamValue = new URLEncoder().encode(request.getRequestURI(), charset);
    	String redirect = 
    			request.getScheme() + "://" + request.getServerName() + 
    			(port == 80 ? "" : ":"+request.getServerPort()) + 
    			request.getContextPath() + redirectUrl + "?redirect=" + redirectParamValue;
    	return redirect;
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		User user = WebUtil.getUser(request);
		if(user != null) {
			request.setAttribute(RequestAttributes.CURRENT_URI_ATTR_NAME, request.getRequestURI());
			Integer shopCarCount = (Integer)request.getSession().getAttribute(Session.SHOPCAR_COUNT);
			if(shopCarCount == null) {
				ShopCarInfo info = shopcarService.getShopCarInfo(user.getNo());
				if(info != null) {
					shopCarCount = Integer.parseInt(info.getCount());
					request.getSession().setAttribute(Session.SHOPCAR_COUNT, shopCarCount);
				}
			}
		}
	}

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		
	}
	
}
