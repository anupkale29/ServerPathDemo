package com.sanctions.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sanctions.domain.ServerNodes;

@Controller
public class AdminController {
	
	@RequestMapping(value = "/getPath")
	public @ResponseBody ServerNodes getPath(HttpServletRequest request) {		
		ServerNodes serverNode =new ServerNodes();
		serverNode.setLoadBalancerIp("10.20.14.47");
		serverNode.setAppServerIp(request.getRemoteAddr());
		serverNode.setWebServerIp(request.getLocalAddr());
		serverNode.setAppServerPort(request.getServerPort());
		return serverNode;
	}

}
