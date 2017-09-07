package com.hanbit.there.api.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.hanbit.there.api.annotation.SignInRequired;
import com.hanbit.there.api.service.MenuService;

@RestController
@RequestMapping("/api/menu")
public class MenuController {

	@Autowired
	private MenuService menuService;
	
	@SignInRequired({"ADMIN", "VIP"})
	@RequestMapping(value="/json", produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
	public String getMenu() {
		return menuService.getMenu();
	}
	
}
