package com.leqie.portal.remote;

import java.io.File;
import java.io.IOException;
import java.io.OutputStream;
import java.net.MalformedURLException;
import java.net.URISyntaxException;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.commons.io.IOUtils;
import org.apache.http.HttpEntity;
import org.apache.http.NameValuePair;
import org.apache.http.client.config.RequestConfig;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.client.utils.URIBuilder;
import org.apache.http.entity.mime.MultipartEntityBuilder;
import org.apache.http.entity.mime.content.FileBody;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.message.BasicNameValuePair;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Component;

import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;

@Component
@PropertySource("classpath:application.properties")
@ConfigurationProperties(prefix="remote.api")
public class RemoteServerImpl implements RemoteServer {
	
	private static final Logger logger = LoggerFactory.getLogger(RemoteServerImpl.class);
	
	@Value("${remote.api.host}")
	private String host;
	
	@Value("${remote.api.port}")
	private int port;
	
	@Value("${remote.api.protocol}")
	private String protocol;
	
	@Value("${remote.api.path}")
	private String path;
	
	@Value("${remote.api.charset}")
	private String charset = "UTF-8";

	@Autowired
    private CloseableHttpClient httpClient;

    @Autowired
    private RequestConfig config;
    
    @Autowired
    private ObjectMapper objectMapper;
    
	@Override
	public void request(String path, OutputStream output) throws IOException {
		try {
			String url = generateUrl(path);
			HttpEntity entity = doGet(url);
			IOUtils.copy(entity.getContent(), output);
		}catch (MalformedURLException e) {
			logger.error("远程请求时，创建url失败！");
			throw e;
		}
	}
	
	@Override
	public <T> T request(String path, Map<String, Object> requestParams, Method method, Class<T> responseType) throws IOException {
		try {
			String url = generateUrl(path);
			if(method == RemoteServer.Method.GET) {
				return json(doGet(url, requestParams), responseType);
			}else if(method == RemoteServer.Method.POST) {
				return json(doPost(url, requestParams), responseType);
			}
		}catch (MalformedURLException e) {
			logger.error("远程请求时，创建url失败！");
			throw e;
		}catch (JsonParseException | JsonMappingException e) {
			logger.error("解析响应结果失败！");
			throw e;
		}
		return null;
	}
	
	@Override
	public <T> T uploadFile(String path, String name, File file, Class<T> responseType) {
		try {
			String url = generateUrl(path);
			
			// 声明 http get 请求
	        HttpPost httpPost = new HttpPost(url);
	        // 装载配置信息
	        httpPost.setConfig(config);
	        HttpEntity entity = 
					MultipartEntityBuilder.create()
						.addPart(name, new FileBody(file))
						.build();
	        httpPost.setEntity(entity);
	        // 发起请求
	        CloseableHttpResponse response = this.httpClient.execute(httpPost);

	        // 判断状态码是否为200
	        if (response.getStatusLine().getStatusCode() == 200) {
	            // 返回响应体的内容
	            return json(response.getEntity(), responseType);
	        }else {
	        	logger.error("请求数据时出现异常，状态码:{}, 文本:{}", 
	        			response.getStatusLine().getStatusCode(),
	        			IOUtils.toString(response.getEntity().getContent(), "UTF-8"));
	        	
	        }
		}catch (MalformedURLException e) {
			logger.error("远程请求时，创建url失败！");
		}catch (JsonParseException | JsonMappingException e) {
			logger.error("解析响应结果失败！");
		}catch (IOException e) {
			logger.error("请求失败！{}", e.getMessage());
		}
		return null;
	}

	protected String generateUrl(String path) throws MalformedURLException {
		if(path.startsWith("http:") || path.startsWith("https:")) {
			return path;
		}else {
			StringBuilder filePath = new StringBuilder(this.path);
			if(!this.path.endsWith("/") && !path.startsWith("/")) {
				filePath.append("/");
			}
			filePath.append(path);
			return new URL(this.protocol, this.host, this.port, filePath.toString()).toString();
		}
	}
	
	private HttpEntity doGet(String url, Map<String, Object> params) throws IOException {
		try {
			URIBuilder uriBuilder = new URIBuilder(url);
	        if(params != null) {
	            // 遍历map,拼接请求参数
	            for (Map.Entry<String, Object> entry : params.entrySet()) {
	                uriBuilder.setParameter(entry.getKey(), entry.getValue().toString());
	            }
	        }
	        // 调用不带参数的get请求
	        return this.doGet(uriBuilder.build().toString());
		}catch (URISyntaxException e) {
			logger.error("远程请求时，生成带参数的url失败！");
			throw new IOException(e);
		}
	}
	
	private HttpEntity doGet(String url) throws IOException {
        // 声明 http get 请求
        HttpGet httpGet = new HttpGet(url);

        // 装载配置信息
        httpGet.setConfig(config);

        // 发起请求
        CloseableHttpResponse response = this.httpClient.execute(httpGet);

        // 判断状态码是否为200
        if (response.getStatusLine().getStatusCode() == 200) {
            // 返回响应体的内容
            return response.getEntity();
        }
        return null;
    }
	
	private HttpEntity doPost(String url, Map<String, Object> params) throws IOException {
		// 声明 http get 请求
        HttpPost httpPost = new HttpPost(url);

        // 装载配置信息
        httpPost.setConfig(config);
        
        if(params != null) {
            // 遍历map, 设置请求参数
        	List<NameValuePair> pairs = new ArrayList<NameValuePair>();
            for (Map.Entry<String, Object> entry : params.entrySet()) {
            	pairs.add(new BasicNameValuePair(entry.getKey(), entry.getValue().toString()));
            }
            httpPost.setEntity(new UrlEncodedFormEntity(pairs, charset));
        }
        
        // 发起请求
        CloseableHttpResponse response = this.httpClient.execute(httpPost);

        // 判断状态码是否为200
        if (response.getStatusLine().getStatusCode() == 200) {
            // 返回响应体的内容
            return response.getEntity();
        }else {
        	logger.error("请求数据时出现异常，状态码:{}, 文本:{}", 
        			response.getStatusLine().getStatusCode(),
        			IOUtils.toString(response.getEntity().getContent(), "UTF-8"));
        	
        }
        return null;
	}
	
	private <T> T json(HttpEntity entity, Class<T> responseType) throws IOException {
		if(entity == null) {
			return null;
		}
		return objectMapper.readValue(entity.getContent(), responseType);
	}
	
	/*
	private <T> List<T> jsonList(HttpEntity entity, Class<T> responseType) throws IOException {
		if(entity == null) {
			return new ArrayList<T>();
		}
		JavaType javaType = objectMapper.getTypeFactory()
				.constructParametricType(List.class, responseType);
		return objectMapper.readValue(entity.getContent(), javaType);
	}
	*/
}
