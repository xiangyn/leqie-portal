package com.leqie.portal.utils;

import java.lang.reflect.Field;
import java.lang.reflect.Modifier;
import java.util.ArrayList;
import java.util.List;

public class ReflactUtil {

	public static List<Field> geteFields(Class<?> modelClass) {
		Field[] fieldArray = modelClass.getDeclaredFields();
		List<Field> fields = new ArrayList<Field>();
		for(Field field : fieldArray) {
			if((field.getModifiers() & Modifier.STATIC) == 0) {
				fields.add(field);
			}
		}
		if(!modelClass.isInterface() && !modelClass.equals(Object.class)) {
			fields.addAll(geteFields(modelClass.getSuperclass()));
		}
		return fields;
	}
	
	public static Object getValue(Field field, Object target) {
		field.setAccessible(true);
		try {
			return field.get(target);
		} catch (IllegalArgumentException e) {
			e.printStackTrace();
		} catch (IllegalAccessException e) {
			e.printStackTrace();
		}
		return null;
	}
}
