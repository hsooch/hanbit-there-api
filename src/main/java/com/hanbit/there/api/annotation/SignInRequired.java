package com.hanbit.there.api.annotation;
/*
 * 어노테이션 정의
 * */

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

@Retention(RetentionPolicy.RUNTIME) // 실행할때 쓰려면 무조건 있어야함
@Target(ElementType.METHOD) 		// 어디다 쓸지
public @interface SignInRequired {
	
	String[] value() default {};

}
