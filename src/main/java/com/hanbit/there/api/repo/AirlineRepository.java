package com.hanbit.there.api.repo;

/*
 * 얘가 DAO 같은 역할을 함. 
 * 메소드명에 따라 자동으로 알아서 만들어줌
 * */
import java.util.List;

import org.springframework.data.couchbase.core.query.Query;
import org.springframework.data.couchbase.core.query.View;
import org.springframework.data.repository.CrudRepository;

import com.hanbit.there.api.domain.Airline;

public interface AirlineRepository extends CrudRepository<Airline, String> {

	@Query("#{#n1ql.selectEntity} WHERE type = $1 AND #{#n1ql.filter}")
	List<Airline> findByType(String type);

	List<Airline> findByTypeOrderById(String type);
	
	List<Airline> findByTypeOrderByIdDesc(String type);
	
	@View(viewName="US")
	List<Airline> findUS();
	
}
