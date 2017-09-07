package com.hanbit.there.api.aop;

import javax.servlet.http.HttpSession;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.reflect.MethodSignature;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.core.annotation.Order;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.hanbit.there.api.HanbitConstatns;
import com.hanbit.there.api.annotation.SignInRequired;
import com.hanbit.there.api.exception.HanbitException;

@Aspect
@Component
@Order(20)		// ExceptionAspect (Order(10)) 와 경합이 붙었을때 순서대로 실행
public class SessionAspect {
	
	private static final Logger logger = LoggerFactory.getLogger(SessionAspect.class);

	// 해당 어노테이션 붙어있는 애들만 실행 될 때
	@Around("@annotation(com.hanbit.there.api.annotation.SignInRequired)")
	public Object checkSignedIn(ProceedingJoinPoint pjp) throws Throwable {
		
		// 세션에 로그인 됐는지 안됐는지 체크
		// 세션을 얻어오려면 리퀘스트에서 겟세션
		ServletRequestAttributes requestAttributes = (ServletRequestAttributes) RequestContextHolder.getRequestAttributes();
		
		HttpSession session = requestAttributes.getRequest().getSession();
		
		// SignInRequired 어노테이션의 밸류값 가져오기
		MethodSignature signature = (MethodSignature) pjp.getSignature();
		SignInRequired signInRequired = signature.getMethod().getAnnotation(SignInRequired.class);
		String[] values = signInRequired.value();
		
		for (String value : values) {
			logger.debug(value);
		}
		
		// 세션에다 값을 넣어줌
		// "signedIn" 같은것들은 상수로 만들어놓는게 좋음. 오타방지도 되고..
		if (session.getAttribute(HanbitConstatns.SIGNIN_KEY) == null) {		// 로그인 상태가 아닐경우
			throw new HanbitException(403, "로그인이 필요합니다.");
		}
		
		//logger.debug("sign in required");	// 이 시점은 before. proceed 하기 전이니까
		
		return pjp.proceed();
	}

}
