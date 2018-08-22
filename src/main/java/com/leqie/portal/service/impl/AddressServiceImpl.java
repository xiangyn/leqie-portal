package com.leqie.portal.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;

import com.leqie.portal.constants.ResponseStatus;
import com.leqie.portal.model.Address;
import com.leqie.portal.model.response.AddressesResponse;
import com.leqie.portal.model.response.Response;
import com.leqie.portal.service.AddressService;

@Service
public class AddressServiceImpl extends AbstarctService implements AddressService {

	@Override
	public List<Address> getAddress(String userId) {
		AddressesResponse resp = 
				getOneParam(API.ADDRESS_LIST, "userId", userId, AddressesResponse.class);
		if(resp != null && ResponseStatus.SUCCESS.equals(resp.getStatus())) {
			return resp.getResult();
		}
		return new ArrayList<>();
	}

	@Override
	public boolean saveAddress(Address address) {
		Response resp = 
				post(API.ADDRESS_NEW, address, Response.class);
		return resp != null && ResponseStatus.SUCCESS.equals(resp.getStatus());
	}

	@Override
	public boolean updateAddress(Address address) {
		Response resp = 
				post(API.ADDRESS_EDIT, address, Response.class);
		return resp != null && ResponseStatus.SUCCESS.equals(resp.getStatus());
	}

	@Override
	public boolean deleteAddress(Address address) {
		Response resp = 
				post(API.ADDRESS_DEL, address, Response.class);
		return resp != null && ResponseStatus.SUCCESS.equals(resp.getStatus());
	}

}
