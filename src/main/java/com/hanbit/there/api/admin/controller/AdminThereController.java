package com.hanbit.there.api.admin.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.hanbit.there.api.admin.service.AdminThereService;
import com.hanbit.there.api.admin.vo.AdminThereGroupVO;
import com.hanbit.there.api.admin.vo.AdminThereVO;
import com.hanbit.there.api.vo.ThereVO;

@RestController
@RequestMapping("/api/admin/there")
public class AdminThereController {

	@Autowired
	private AdminThereService adminThereService;

	private ObjectMapper mapper = new ObjectMapper();

	// 지역 그룹들
	@RequestMapping("/groups")
	public List<AdminThereGroupVO> listThereGroups() {
		return adminThereService.listThereGroups();
	}

	// 지역그룹 순서 바꾸기
	@RequestMapping("/group/order")
	public List<AdminThereGroupVO> modifyThereGroupOrder(@RequestParam("idUp") String idUp,
														 @RequestParam("idDown") String idDown) {
		adminThereService.modifyThereGroupOrder(idUp, idDown);

		return adminThereService.listThereGroups();
	}

	// 지역그룹 불러오기 (아이디별)
	@GetMapping("/group/{id}")
	public AdminThereGroupVO getThereGroup(@PathVariable("id") String id) {
		return adminThereService.getThereGroup(id);
	}

	// 지역그룹 수정
	@PostMapping("/group/{id}")
	public Map<String, Boolean> modifyThereGroup(@PathVariable("id") String id,
								@RequestParam("name") String name) {
		AdminThereGroupVO groupVO = new AdminThereGroupVO();
		groupVO.setId(id);
		groupVO.setName(name);

		adminThereService.modifyThereGroup(groupVO);

		// 별의미없음. 걍 보내는거임
		Map<String, Boolean> result = new HashMap<String, Boolean>();
		result.put("ok", true);

		return result;
	}

	// 지역 그룹 삭제
	@DeleteMapping("/group/{id}")
	public Map<String, Boolean> removeThereGroup(@PathVariable("id") String id) {
		adminThereService.removeThereGroup(id);

		Map<String, Boolean> result = new HashMap<String, Boolean>();
		result.put("ok", true);

		return result;
	}

	// 지역 그룹 추가 (아이디 없음)
	@PostMapping("/group/add")
	public Map<String, Boolean> addThereGroup(@RequestParam("id") String id,
							 @RequestParam("name") String name) {
		AdminThereGroupVO groupVO = new AdminThereGroupVO();
		groupVO.setId(id);
		groupVO.setName(name);

		adminThereService.addThereGroup(groupVO);

		Map<String, Boolean> result = new HashMap<String, Boolean>();
		result.put("ok", true);

		return result;
	}

	// 지역그룹 아이디가 있나없나
	@RequestMapping(value = "/group/{id}", method = RequestMethod.OPTIONS)
	public Map<String, Boolean> hasThereGroupId(@PathVariable("id") String id) {
		boolean exists = adminThereService.hasThereGroupId(id);

		Map<String, Boolean> result = new HashMap<String, Boolean>();
		result.put("exists", exists);

		return result;
	}

	// 그룹별 지역정보 불러오기
	@RequestMapping("/list")
	public List<AdminThereVO> listTheres(@RequestParam("groupId") String groupId) {
		return adminThereService.listTheres(groupId);
	}

	@RequestMapping(value = "/{id}", method = RequestMethod.OPTIONS)
	public Map<String, Boolean> hasThereId(@PathVariable("id") String id) {
		boolean exists = adminThereService.hasThereId(id);

		Map<String, Boolean> result = new HashMap<String, Boolean>();
		result.put("exists", exists);

		return result;
	}

	// 지역정보 수정
	@PostMapping("/{id}")
	public Map<String, Boolean> modifyThere(@PathVariable("id") String id, MultipartHttpServletRequest request) throws Exception {

		String json = request.getParameter("json");
		ThereVO there = mapper.readValue(json, ThereVO.class);

		MultipartFile background = request.getFile("background");

		adminThereService.modifyThere(there, background);
		
		Map<String, Boolean> result = new HashMap<String, Boolean>();
		result.put("ok", true);

		return result;
	}
	
	@PostMapping("/add")
	public Map<String, Boolean> addThere(@RequestParam("json") String json,
						@RequestParam("background") MultipartFile background) throws Exception {
		
		ThereVO there = mapper.readValue(json, ThereVO.class);
		
		adminThereService.addThere(there, background);
		
		Map<String, Boolean> result = new HashMap<String, Boolean>();
		result.put("ok", true);

		return result;
	}
	
	@DeleteMapping("/{id}")
	public Map<String, Boolean> removeThere(@PathVariable("id") String id) {
		adminThereService.removeThere(id);
		
		Map<String, Boolean> result = new HashMap<String, Boolean>();
		result.put("ok", true);

		return result;
	}

}
