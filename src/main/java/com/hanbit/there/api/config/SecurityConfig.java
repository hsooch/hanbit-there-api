package com.hanbit.there.api.config;

/*
 * 암호화 빈 등록. 서비스에서 new 할 필요 없음
 * */
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.crypto.password.StandardPasswordEncoder;

@Configuration
public class SecurityConfig {

	@Bean
	public PasswordEncoder passwordEncoder() {
		return new StandardPasswordEncoder("hanbit");
	}

}
