package com.sanctions.domain;

import org.springframework.stereotype.Component;

@Component
public class ServerNodes {
	
	String loadBalancerIp;
	String webServerIp;
	String appServerIp;
	int appServerPort;
	public String getLoadBalancerIp() {
		return loadBalancerIp;
	}
	public void setLoadBalancerIp(String loadBalancerIp) {
		this.loadBalancerIp = loadBalancerIp;
	}
	public String getWebServerIp() {
		return webServerIp;
	}
	public void setWebServerIp(String webServerIp) {
		this.webServerIp = webServerIp;
	}
	public String getAppServerIp() {
		return appServerIp;
	}
	public void setAppServerIp(String appServerIp) {
		this.appServerIp = appServerIp;
	}
	public int getAppServerPort() {
		return appServerPort;
	}
	public void setAppServerPort(int appServerPort) {
		this.appServerPort = appServerPort;
	}
}
