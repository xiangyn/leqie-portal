package com.leqie.portal.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;

import com.leqie.portal.constants.ResponseStatus;
import com.leqie.portal.model.Address;
import com.leqie.portal.model.response.AddressesResponse;
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

}
