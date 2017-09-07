package com.hanbit.there.api.config;

import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.annotation.EnableTransactionManagement;

// 자동으로 설정 하고 트랜잭션도 자동으로
@Configuration
@EnableAutoConfiguration
@EnableTransactionManagement
public class DatabaseConfig {
	
	@Autowired
	private ApplicationContext applicationContext;
	
	// 트랜잭션 매니지먼트 하려면 트랜잭션 매니저를 만들어야함
	@Bean
	public PlatformTransactionManager transactionManager(DataSource dataSource) {	// bean을 생성할때 파라미터로 주는것들은 다른 빈을 찾아 넣어줌
		return new DataSourceTransactionManager(dataSource);
	}

	@Bean
	public SqlSessionFactory sqlSessionFactory(DataSource dataSource) throws Exception {
		// sqlSessionFactory 는 인터페이스라서 SqlSessionFactoryBean() 으로 만들어야함
		SqlSessionFactoryBean sqlSessionFactory = new SqlSessionFactoryBean();
		sqlSessionFactory.setDataSource(dataSource);
		sqlSessionFactory.setConfigLocation(applicationContext.getResource("classpath:mybatis/mybatis-config.xml"));
		sqlSessionFactory.setMapperLocations(applicationContext.getResources("classpath:mybatis/mappers/**/*.xml"));
		
		return sqlSessionFactory.getObject();
	}
	
	@Bean
	public SqlSessionTemplate sqlSession(SqlSessionFactory sqlSessionFactory) {
		return new SqlSessionTemplate(sqlSessionFactory);
	}
	
}
