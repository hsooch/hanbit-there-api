package com.hanbit.there.api.exception;

public class ExceptionVO {

	private int errorCode;
	private String message;

	public ExceptionVO() {} // 잭슨이 기본생성자 사용하므로 있어야함

	public ExceptionVO(String message) {
		this(0, message);	// 아래 생성자가 실행되는거임
	}
	
	public ExceptionVO(int errorCode, String message) {
		this.errorCode = errorCode;
		this.message = message;
	}

	public int getErrorCode() {
		return errorCode;
	}

	public void setErrorCode(int errorCode) {
		this.errorCode = errorCode;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

}
