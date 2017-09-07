package com.hanbit.there.api.repo;
/*
 * 도메인당 레파지토리 하나씩 필요함
 * */

import org.springframework.data.repository.CrudRepository;

import com.hanbit.there.api.domain.Airport;

public interface AirportRepository extends CrudRepository<Airport, String> {

}
