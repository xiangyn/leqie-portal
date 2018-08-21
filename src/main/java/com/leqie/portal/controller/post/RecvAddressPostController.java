package com.leqie.portal.controller.post;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.leqie.portal.model.Address;
import com.leqie.portal.service.AddressService;
import com.leqie.portal.utils.WebUtil;
import com.leqie.portal.web.model.ListResult;

@RestController
@RequestMapping(method=RequestMethod.POST)
public class RecvAddressPostController {
	
	@Autowired
	private AddressService service;

	@RequestMapping("/app/loadAddresses.jo")
	public ListResult<Address> loadAddresses(HttpServletRequest request) {
		List<Address> data = service.getAddress(WebUtil.getUserId(request));
		return new ListResult<Address>(data);
	}
	
}
