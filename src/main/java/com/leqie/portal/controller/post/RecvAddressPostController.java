package com.leqie.portal.controller.post;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.leqie.portal.model.Address;
import com.leqie.portal.service.AddressService;
import com.leqie.portal.utils.WebUtil;
import com.leqie.portal.web.model.ListResult;
import com.leqie.portal.web.model.Result;

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
	
	@RequestMapping("/app/recvAddress/save.jo")
	public Result<Void> save(@ModelAttribute("model")Address address, HttpServletRequest request) {
		address.setUser(null);
		address.setUserId(WebUtil.getUserId(request));
		address.setMoren("on".equals(address.getMoren()) ? "1" : "0");
		address.setAddress(null);
		return new Result<Void>(service.saveAddress(address));
	}
	
	@RequestMapping("/app/recvAddress/update.jo")
	public Result<Void> update(@ModelAttribute("model")Address address, HttpServletRequest request) {
		address.setUser(null);
		address.setUserId(WebUtil.getUserId(request));
		address.setMoren("on".equals(address.getMoren()) ? "1" : "0");
		address.setAddress(null);
		address.setAddressId(address.getId());
		return new Result<Void>(service.updateAddress(address));
	}
	
	@RequestMapping("/app/recvAddress/delete.jo")
	public Result<Void> update(@RequestParam("id")int id, HttpServletRequest request) {
		Address address = new Address();
		address.setUserId(WebUtil.getUserId(request));
		address.setId(id);
		return new Result<Void>(service.deleteAddress(address));
	}
	
}
