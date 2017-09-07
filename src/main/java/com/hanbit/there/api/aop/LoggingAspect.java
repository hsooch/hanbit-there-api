package com.hanbit.there.api.aop;

import javax.servlet.http.HttpServletRequest;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.aspectj.lang.reflect.MethodSignature;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

@Aspect
@Component // 이걸 붙여줘야 Bean 으로 등록이 됨
public class LoggingAspect {

	private static final Logger logger = LoggerFactory.getLogger(LoggingAspect.class);
	
	// 표현식 자체를 변수화 할 수 있다
	// execution(수식어패턴? 리턴타입패턴 패키지패턴?이름패턴(파라미터패턴)
	@Pointcut("@annotation(org.springframework.web.bind.annotation.RequestMapping)")	// RequestMapping 이 붙어있는 메소드
	public void allControllerMethod() {
		
	}
	
	@Before(value="allControllerMethod()", argNames="joinPoint")
	public void logRequest(JoinPoint joinPoint) {
		MethodSignature signature = (MethodSignature) joinPoint.getSignature();
		String methodName = signature.toShortString();
		
		ServletRequestAttributes requestAttributes = (ServletRequestAttributes) RequestContextHolder.getRequestAttributes();
		HttpServletRequest request = requestAttributes.getRequest();
		String remoteAddr = request.getRemoteAddr();
		String uri = request.getRequestURI();
		
		logger.debug(methodName + " has requested by " + remoteAddr + "(" + uri + ")");
	}
	
}
