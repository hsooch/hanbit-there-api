package com.hanbit.there.api.admin.service;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.io.FilenameUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.hanbit.there.api.admin.repo.AdminActivityRepository;
import com.hanbit.there.api.domain.Activity;
import com.hanbit.there.api.service.FileService;
import com.hanbit.there.api.vo.FileVO;

@Service
public class AdminActivityService {

	@Autowired
	private AdminActivityRepository adminActivityRepository;

	@Autowired
	private FileService fileService;

	public List<Activity> getActivities(String thereId) {
		return adminActivityRepository.findByThereIdOrderByName(thereId);
	}

	public boolean hasActivityId(String id) {
		return adminActivityRepository.exists(id);
	}

	// 파일처리하고 파일의 주소들을 activity photos 에 넣어줘야함
	@Transactional
	public void saveActivity(Activity activity, List<MultipartFile> photos) throws Exception {
		
		// 기존 파일
		Activity oldActivity = adminActivityRepository.findOne(activity.getId());
		
		List<String> photoList = null;
		int lastIndex = 0;
		
		if (oldActivity == null || oldActivity.getPhotos() == null) {	// 신규일 경우
			photoList = new ArrayList<>();
		}
		else {
			photoList = oldActivity.getPhotos();
			String lastFileUrl = photoList.get(photoList.size() - 1);
			lastIndex = (Integer.valueOf(StringUtils.substringAfterLast(lastFileUrl, "_")) + 1);	// lastFileUrl 에서 _ 뒤에있는거
			
			// 리스트 뒤에서부터 돌려야함. 왜냐면 앞에서 부터 돌리면 파일 지울때 인덱스 문제생김
			for (int i=(oldActivity.getPhotos().size() - 1); i>-1; i--) {
				String photoUrl = activity.getPhotos().get(i);
				
				if (!"_removed_".equals(photoUrl)) {
					continue;
				}
				
				String oldUrl = photoList.get(i);
				String oldFileId = StringUtils.substringAfterLast(oldUrl, "/");
				
				fileService.removeFile(oldFileId);
				photoList.remove(i);
			}
		}
		
		for (int i = 0; i < photos.size(); i++) {
			MultipartFile photo = photos.get(i);

			String fileName = activity.getId() + "_" + (lastIndex + i);
			String fileExt = FilenameUtils.getExtension(photo.getOriginalFilename());
			String fileId = "activity-" + fileName;
			String filePath = "/hanbit/webpack/hanbit-there/src/img/activities/" + fileName + "." +fileExt;

			FileVO fileVO = new FileVO();
			fileVO.setFileId(fileId);
			fileVO.setFilePath(filePath);
			fileVO.setFileName(photo.getOriginalFilename());
			fileVO.setContentType(photo.getContentType());
			fileVO.setContentLength(photo.getSize());

			fileService.addFile(fileVO, photo.getInputStream());
			
			String fileUrl = "/api/file/" + fileId;
			photoList.add(fileUrl);
		}
		
		activity.setPhotos(photoList);

		adminActivityRepository.save(activity);
	}

}
