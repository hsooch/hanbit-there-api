package com.hanbit.there.api.exception;

/*
 * 우리가 정의한 예외처리 클래스
 * */
public class HanbitException extends RuntimeException {

	private int errorCode = 500;

	public HanbitException(String message) {
		super(message);
	}

	public HanbitException(int errorCode, String message) {
		this(message);
		
		this.errorCode = errorCode;
	}

	public int getErrorCode() {
		return errorCode;
	}

	public void setErrorCode(int errorCode) {
		this.errorCode = errorCode;
	}

}
