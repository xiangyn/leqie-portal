package com.leqie.portal.web.util;

import java.lang.reflect.Field;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.leqie.portal.utils.ReflactUtil;

public class RequestUtil {

	public static Map<String, Object> toParams(Object target) {
		List<Field> fields = ReflactUtil.geteFields(target.getClass());
		Map<String, Object> params = new HashMap<String, Object>();
		for(Field field : fields) {
			Object value = ReflactUtil.getValue(field, target);
			if(value instanceof String) {
				if("".equals(((String)value).trim())) {
					value = null;
				}
			}
			if(value != null) {
				params.put(field.getName(), value);
			}
		}
		return params;
	}
	
}
