package com.jk.bean.aop;

import org.springframework.data.annotation.Id;

public class Logs {
	@Id
	private String logId;
	private String clazzName;
	private String methodName;
	private String params;
	private String tiem;
	private String timeMax;
	private String timeMin;
	
	
	
	public String getTimeMax() {
		return timeMax;
	}
	public void setTimeMax(String timeMax) {
		this.timeMax = timeMax;
	}
	public String getTimeMin() {
		return timeMin;
	}
	public void setTimeMin(String timeMin) {
		this.timeMin = timeMin;
	}
	public String getParams() {
		return params;
	}
	public void setParams(String params) {
		this.params = params;
	}
	public String getLogId() {
		return logId;
	}
	public void setLogId(String logId) {
		this.logId = logId;
	}
	public String getClazzName() {
		return clazzName;
	}
	public void setClazzName(String clazzName) {
		this.clazzName = clazzName;
	}
	public String getMethodName() {
		return methodName;
	}
	public void setMethodName(String methodName) {
		this.methodName = methodName;
	}
	
	public String getTiem() {
		return tiem;
	}
	public void setTiem(String tiem) {
		this.tiem = tiem;
	}
	@Override
	public String toString() {
		return "Logs [logId=" + logId + ", clazzName=" + clazzName
				+ ", methodName=" + methodName + ", params=" + params
				+ ", tiem=" + tiem + ", timeMax=" + timeMax + ", timeMin="
				+ timeMin + "]";
	}
	
	
}
