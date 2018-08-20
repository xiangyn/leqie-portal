package com.leqie.portal.service.impl;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;

import com.leqie.portal.model.response.Response;
import com.leqie.portal.remote.Api;
import com.leqie.portal.remote.RemoteServer;
import com.leqie.portal.remote.RemoteServer.Method;
import com.leqie.portal.web.util.RequestUtil;

public abstract class AbstarctService {

	@Autowired
	protected RemoteServer server;
	
	@Autowired
	protected Api API;
	
	protected <T extends Response> T post(String path, Object params, Class<T> responseType) {
		try {
			return server.request(path, RequestUtil.toParams(params), Method.POST, responseType);
		}catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	protected <T extends Response> T get(String path, Object params, Class<T> responseType) {
		try {
			return server.request(path, RequestUtil.toParams(params), Method.GET, responseType);
		}catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	protected <T extends Response> T postOneParam(String path, String paramName, Object paramValue, Class<T> responseType) {
		try {
			Map<String, Object> params = new HashMap<String, Object>();
			params.put(paramName, paramValue);
			return server.request(path, params, Method.POST, responseType);
		}catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	protected <T extends Response> T getOneParam(String path, String paramName, Object paramValue, Class<T> responseType) {
		try {
			Map<String, Object> params = new HashMap<String, Object>();
			params.put(paramName, paramValue);
			return server.request(path, params, Method.GET, responseType);
		}catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}
	
}
