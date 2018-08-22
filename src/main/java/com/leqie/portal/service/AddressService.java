package com.leqie.portal.service;

import java.util.List;

import com.leqie.portal.model.Address;

public interface AddressService {

	List<Address> getAddress(String userId);

	boolean saveAddress(Address address);

	boolean updateAddress(Address address);
	
	boolean deleteAddress(Address address);
	
}
