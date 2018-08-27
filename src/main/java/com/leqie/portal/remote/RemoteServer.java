package com.leqie.portal.remote;

import java.io.File;
import java.io.IOException;
import java.io.OutputStream;
import java.util.Map;

public interface RemoteServer {
	
	enum Method {
		GET, POST;
	}
	
	void request(String path, OutputStream output) throws IOException;

	<T> T request(String path, Map<String, Object> requestParam, Method method,
			Class<T> responseType) throws IOException;
	
	<T> T uploadFile(String path, String name, File file, Class<T> responseType);
	
}
