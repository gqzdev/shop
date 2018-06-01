package com.gqz.shop.util;

public class MyException extends Exception {

	/**
	* @Fields serialVersionUID : TODO(用一句话描述这个变量表示什么)
	*/
	private static final long serialVersionUID = 1L;
	
	private String message;

	
	
	public MyException(String message) {
		super();
		this.message = message;
	}

	public MyException() {
		super();
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}
	
	
}
