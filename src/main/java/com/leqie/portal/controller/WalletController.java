package com.leqie.portal.controller;

import static com.leqie.portal.remote.Api.SERVER_URL;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.http.NameValuePair;
import org.apache.http.message.BasicNameValuePair;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSONObject;
import com.leqie.portal.constants.Session;
import com.leqie.portal.constants.Template;
import com.leqie.portal.constants.Url;
import com.leqie.portal.model.User;
import com.leqie.portal.utils.HttpHelper;
import com.leqie.portal.utils.JsonUtils;

@RestController
@RequestMapping(Url.WALLET)
public class WalletController {
    @GetMapping
    public ModelAndView index(HttpServletRequest request, ModelAndView mv, ModelMap map) {
        mv.setViewName(Template.WALLET_INDEX);

        User user = (User) request.getSession().getAttribute(Session.USER);
        String url = SERVER_URL+"/leqie/user/getQianBao?userId=" + user.getId();
        String json = HttpHelper.httpGet(url);
        JSONObject result = JsonUtils.parse(json, JSONObject.class);
        if (Integer.parseInt(result.get("status").toString()) == 1) {
            map.put("tip", "userMoney");
            map.put("money", result.get("money"));
        }
        return mv;
    }

    @RequestMapping(Url.WALLET_RECORD)
    public ModelAndView newRecvAddress(ModelAndView mv) {
        mv.setViewName(Template.WALLET_RECORD);
        return mv;
    }

    @GetMapping("/chargeList")
    public ModelAndView chargeList(@RequestParam(name = "p") String page, HttpServletRequest request, ModelAndView mv, ModelMap map) {
        User user = (User) request.getSession().getAttribute(Session.USER);
        String url = SERVER_URL+"/leqie/user/qianbaoChongZhiList?userId=" + user.getId() + "&pageNum=" + page;
        System.out.println("--url--" + url);
        String json = HttpHelper.httpGet(url);
        JSONObject result = JsonUtils.parse(json, JSONObject.class);
        if (Integer.parseInt(result.get("status").toString()) == 1) {
            map.put("tip", "chargeList");
            map.put("chargeList", (List<?>) result.get("result"));
            map.put("page", Integer.parseInt(page));
            map.put("totalRecords", result.get("count"));
        }
        mv.setViewName(Template.WALLET_INDEX);
        return mv;
    }


    @GetMapping("/consumeList")
    public ModelAndView consumeList(@RequestParam(name = "p") String page, HttpServletRequest request, ModelAndView mv, ModelMap map) {
        User user = (User) request.getSession().getAttribute(Session.USER);
        String url = SERVER_URL+"/leqie/user/qianBaoBillList?userId=" + user.getId() + "&pageNum=" + page;
        System.out.println("--url--" + url);
        String json = HttpHelper.httpGet(url);
        JSONObject result = JsonUtils.parse(json, JSONObject.class);
        if (Integer.parseInt(result.get("status").toString()) == 1) {
            map.put("tip", "consumeList");
            map.put("consumeList", (List<?>) result.get("result"));
            map.put("page", Integer.parseInt(page));
            map.put("totalRecords", result.get("count"));
        }
        mv.setViewName(Template.WALLET_INDEX);
        return mv;
    }

    @GetMapping("/withdraw")
    public ModelAndView withdraw(ModelAndView mv, ModelMap map) {
        map.put("tip", "withdraw");
        mv.setViewName(Template.WALLET_INDEX);
        return mv;
    }

    @PostMapping(value = "/withdraw")
    public Object saveWithdraw(HttpServletRequest request, ModelMap map) {

        User user = (User) request.getSession().getAttribute(Session.USER);
        String money = request.getParameter("money");
        String name = request.getParameter("name");
        String account = request.getParameter("account");
        String person = request.getParameter("person");
        String address = request.getParameter("address");

        NameValuePair[] params = new NameValuePair[6];
        params[0] = new BasicNameValuePair("userId", user.getId() + "");
        params[1] = new BasicNameValuePair("money", money);
        params[2] = new BasicNameValuePair("bank", name);
        params[3] = new BasicNameValuePair("bankNo", account);
        params[4] = new BasicNameValuePair("bankName", person);
        params[5] = new BasicNameValuePair("bankAddress", address);
        String url = SERVER_URL+"/leqie/user/withdrawSave";
        String json = HttpHelper.httpPost(url, params, null, "application/json");
        JSONObject result = JsonUtils.parse(json, JSONObject.class);
        System.out.println(result);
        return result;
    }

    @GetMapping("/withdrawList")
    public ModelAndView withdrawList(@RequestParam(name = "p") String page, HttpServletRequest request, ModelAndView mv, ModelMap map) {
        User user = (User) request.getSession().getAttribute(Session.USER);
        String url = SERVER_URL+"/leqie/user/withdrawList?userId=" + user.getId() + "&p=" + page;
        System.out.println("--url--" + url);
        String json = HttpHelper.httpGet(url);
        JSONObject result = JsonUtils.parse(json, JSONObject.class);
        if (Integer.parseInt(result.get("status").toString()) == 1) {
            map.put("tip", "withdrawList");
            map.put("withdrawList", (List<?>) result.get("list"));
            map.put("page", Integer.parseInt(page));
            map.put("totalRecords", result.get("count"));
        }
        mv.setViewName(Template.WALLET_INDEX);
        return mv;
    }


}
