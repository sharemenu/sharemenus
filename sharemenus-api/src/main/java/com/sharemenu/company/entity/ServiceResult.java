package com.sharemenu.company.entity;

import java.io.Serializable;

public class ServiceResult<T> implements Serializable {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -3878540804380430943L;

	public boolean success = true;

	public String message;
	
	public T resultBody;
	
	public ServiceResult(){
		
	}
	
	public ServiceResult(boolean isSuccess,String errorMessage){
		success = isSuccess;
		message = errorMessage;
	}


	public boolean isSuccess() {
		return success;
	}


	public void setSuccess(boolean success) {
		this.success = success;
	}


	public String getMessage() {
		return message;
	}


	public void setMessage(String message) {
		this.message = message;
	}


	public T getResultBody() {
		return resultBody;
	}


	public void setResultBody(T resultBody) {
		this.resultBody = resultBody;
	}
	
	 
}
