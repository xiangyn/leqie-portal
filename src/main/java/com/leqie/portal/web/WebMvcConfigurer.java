package com.leqie.portal.web;

import java.nio.charset.Charset;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowire;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.util.CollectionUtils;
import org.springframework.web.servlet.config.annotation.InterceptorRegistration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;

import com.leqie.portal.web.interceptor.UserInterceptor;

@Configuration
public class WebMvcConfigurer extends WebMvcConfigurerAdapter {
	
	@Value("#{'${app.url.notlogins}'.split(',')}")
	private List<String> notLoginUrl;
	
	@Value("${app.url.page.login}")
	private String redirectUrl;
	
	@Value("${app.url.charset}")
	private String charset;

	/**
     * 配置静态资源
     */
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        registry.addResourceHandler("/static/**").addResourceLocations("classpath:/static/");
        super.addResourceHandlers(registry);
    }

    public void addInterceptors(InterceptorRegistry registry) {
        //addPathPatterns 用于添加拦截规则
        //excludePathPatterns 用于排除拦截
    	
    	InterceptorRegistration interceptorRegistration = 
    			registry.addInterceptor(getInterceptor()).addPathPatterns("/app/**");
        if(!CollectionUtils.isEmpty(notLoginUrl)) {
        	for(String url : notLoginUrl) {
        		interceptorRegistration.excludePathPatterns(url);
        	}
        }
        super.addInterceptors(registry);
    }
    
    @Bean(autowire = Autowire.BY_TYPE)
    public UserInterceptor getInterceptor() {
    	UserInterceptor userInterceptor = new UserInterceptor();
    	userInterceptor.setRedirectUrl(redirectUrl);
    	userInterceptor.setCharset(Charset.forName(charset));
    	return userInterceptor;
    }
    
}
