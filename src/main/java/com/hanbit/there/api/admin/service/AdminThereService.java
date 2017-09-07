package com.hanbit.there.api.admin.service;

import java.io.IOException;
import java.util.List;

import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.hanbit.there.api.admin.dao.AdminThereDAO;
import com.hanbit.there.api.admin.vo.AdminThereGroupVO;
import com.hanbit.there.api.admin.vo.AdminThereVO;
import com.hanbit.there.api.service.FileService;
import com.hanbit.there.api.service.MenuService;
import com.hanbit.there.api.vo.FileVO;
import com.hanbit.there.api.vo.ThereVO;

@Service
public class AdminThereService {
	
	@Autowired
	private AdminThereDAO adminThereDAO;
	
	@Autowired
	private FileService fileService;
	
	@Autowired
	private MenuService menuService;

	public List<AdminThereGroupVO> listThereGroups() {
		return adminThereDAO.selectThereGroups();
	}
	
	// 아래 어노테이션 붙이면 Transaction 처리를 스프링이 알아서 해줌 (rollback, commit..)
	@Transactional
	public void modifyThereGroupOrder(String idUp, String idDown) {
		adminThereDAO.updateThereGroupOrder(idUp, -1);
		adminThereDAO.updateThereGroupOrder(idDown, 1);
		
		menuService.invalidateCache();
	}
	
	public AdminThereGroupVO getThereGroup(String id) {
		return adminThereDAO.selectThereGroup(id);
	}
	
	public void modifyThereGroup(AdminThereGroupVO groupVO) {
		adminThereDAO.updateThereGroup(groupVO);
		
		menuService.invalidateCache();
	}
	
	public void removeThereGroup(String id) {
		adminThereDAO.deleteThereGroup(id);
		
		menuService.invalidateCache();
	}
	
	public void addThereGroup(AdminThereGroupVO groupVO) {
		adminThereDAO.insertThereGroup(groupVO);
		
		menuService.invalidateCache();
	}
	
	public boolean hasThereGroupId(String id) {
		return adminThereDAO.countThereGroupId(id) > 0;	// 1=true, 0=false
	}
	
	public List<AdminThereVO> listTheres(String groupId) {
		return adminThereDAO.selectTheres(groupId);
	}
	
	public boolean hasThereId(String id) {
		return adminThereDAO.countThereId(id) > 0;
	}
	
	@Transactional
	public void modifyThere(ThereVO thereVO, MultipartFile background) {
		String backgroundFileId = "there-" + thereVO.getId();
		
		if (background != null) {
			thereVO.setBackground("/api/file/" + backgroundFileId);
		}
		
		adminThereDAO.updateThere(thereVO);
		adminThereDAO.replaceLocation(thereVO);

		adminThereDAO.deleteInfos(thereVO.getId());
		if (thereVO.getAreaInfo().size() > 0) {
			adminThereDAO.insertInfos(thereVO);
		}

		adminThereDAO.deleteTraffics(thereVO.getId());
		if (thereVO.getTraffics().size() > 0) {
			adminThereDAO.insertTraffics(thereVO);
		}
		
		if (background != null) {
			FileVO fileVO = new FileVO();
			fileVO.setFileId(backgroundFileId);
			
			String fileExt = FilenameUtils.getExtension(background.getOriginalFilename());
			String fileName = thereVO.getId() + "." + fileExt;
			
			fileVO.setFilePath("/hanbit/webpack/hanbit-there/src/img/theres/" + fileName);
			fileVO.setFileName(fileName);
			fileVO.setContentType(background.getContentType());
			fileVO.setContentLength(background.getSize());

			try {
				fileService.modifyFile(fileVO, background.getInputStream());	// 에러나면 롤백되야해서 쓰로우 하면안됨
			}
			catch (IOException e) {
				throw new RuntimeException(e);
			}
		}
		
		menuService.invalidateCache();
	}
	
	@Transactional
	public void addThere(ThereVO thereVO, MultipartFile background) {
		String backgroundFileId = "there-" + thereVO.getId();
		
		thereVO.setBackground("/api/file/" + backgroundFileId);
		adminThereDAO.insertThere(thereVO);
		adminThereDAO.replaceLocation(thereVO);
		
		if (thereVO.getAreaInfo().size() > 0) {
			adminThereDAO.insertInfos(thereVO);
		}

		if (thereVO.getTraffics().size() > 0) {
			adminThereDAO.insertTraffics(thereVO);
		}
		
		FileVO fileVO = new FileVO();
		fileVO.setFileId(backgroundFileId);
		
		String fileExt = FilenameUtils.getExtension(background.getOriginalFilename());
		String fileName = thereVO.getId() + "." + fileExt;
		
		fileVO.setContentType(background.getContentType());
		fileVO.setContentLength(background.getSize());
		fileVO.setFileName(background.getOriginalFilename());
		fileVO.setFilePath("/hanbit/webpack/hanbit-there/src/img/theres/" + fileName);
		
		try {
			fileService.addFile(fileVO, background.getInputStream());
		}
		catch (IOException e) {
			throw new RuntimeException(e);
		}
		
		menuService.invalidateCache();
	}
	
	@Transactional
	public void removeThere(String id) {
		String backgroundFileId = "there-" + id;
		
		adminThereDAO.deleteLocation(id);
		adminThereDAO.deleteInfos(id);
		adminThereDAO.deleteTraffics(id);
		adminThereDAO.deleteThere(id);
		
		fileService.removeFile(backgroundFileId);
		
		menuService.invalidateCache();
	}
	
}


























