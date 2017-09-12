package com.hanbit.there.api.service;

import java.io.IOException;
import java.util.Random;

import org.apache.commons.io.FilenameUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.hanbit.there.api.dao.MemberDAO;
import com.hanbit.there.api.exception.HanbitException;
import com.hanbit.there.api.vo.FileVO;
import com.hanbit.there.api.vo.MemberVO;

@Service
public class MemberService {

	private static final char[] CHARS = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789".toCharArray();

	@Autowired
	private MemberDAO memberDAO;
	@Autowired
	private PasswordEncoder passwordEncoder; // SecurityConfig 클래스에 빈 으로 등록 해놓음
	@Autowired
	private FileService fileService;

	public void signUp(MemberVO memberVO) {
		if (memberDAO.countMember(memberVO.getEmail()) > 0) {
			throw new HanbitException("이미 가입된 이메일 입니다.");
		}

		memberVO.setUid(generateUid());

		// 패스워드 암호화
		String encodedPassword = passwordEncoder.encode(memberVO.getPassword());
		memberVO.setPassword(encodedPassword);

		memberDAO.insertMember(memberVO);
	}

	public String generateUid() {
		int length = 12;
		char[] uid = new char[length];

		Random random = new Random();

		// CHARS 배열에 있는 문자들을 랜덤으로 조합해서 12자리 문자열 생성해줌
		for (int i = 0; i < length; i++) {
			uid[i] = CHARS[random.nextInt(CHARS.length)];
		}

		return new String(uid);
	}

	public MemberVO signIn(String email, String password) {	// email, password 따로 받을거임
		MemberVO memberVO = memberDAO.selectMember(email);
		
		if (memberVO == null) {
			throw new HanbitException("가입되지 않은 이메일입니다.");
		}
		
		// 비교
		if (!passwordEncoder.matches(password, memberVO.getPassword())) {
			throw new HanbitException("잘못된 비밀번호입니다.");
		}
		
		return memberVO;	// 이걸 갖고 로그인 되어있는 상태로 만들어줘야함, 컨트롤러에서 세션에 저장해야함
	}
	
	public MemberVO getMemberDetail(String uid) {
		return memberDAO.selectMemberDetail(uid);
	}
	
	@Transactional
	public void saveMemberDetail(MemberVO memberVO, MultipartFile image) throws IOException {
		// 사진이 있으면
		if (image != null) {
			FileVO fileVO = new FileVO();
			
			String fileId = "avatar-" + memberVO.getUid();
			fileVO.setFileId(fileId);
			
			String fileExt = FilenameUtils.getExtension(image.getOriginalFilename());
			String fileName = memberVO.getUid() + "." + fileExt;
			fileVO.setFileName(fileName);
			fileVO.setFilePath("/hanbit/webpack/hanbit-there/src/img/avatars/" + fileName);
			
			fileVO.setContentType(image.getContentType());
			fileVO.setContentLength(image.getSize());
			
			fileService.modifyFile(fileVO, image.getInputStream(), 200);
			memberVO.getDetail().setAvatar("/api/file/" + fileId);
		}
		
		memberDAO.insertMemberDetail(memberVO);
		
		// 패스워드가 있으면
		if (StringUtils.isNotBlank(memberVO.getCurrentPw())) {
			changePassword(memberVO.getUid(), memberVO.getCurrentPw(), memberVO.getPassword());
		}
	}
	
	private void changePassword(String uid, String currentPw, String newPw) {
		String encodedPw = memberDAO.selectPassword(uid);	// 암호화 된 패스워드
		
		if (!passwordEncoder.matches(currentPw, encodedPw)) {
			throw new HanbitException("현재 패스워드가 일치하지 않습니다.");
		}
		
		String password = passwordEncoder.encode(newPw);
		
		MemberVO memberVO = new MemberVO();
		memberVO.setUid(uid);
		memberVO.setPassword(password);
		
		memberDAO.updatePassword(memberVO);
	}

}
