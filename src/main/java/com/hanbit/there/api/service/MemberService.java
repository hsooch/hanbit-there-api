package com.hanbit.there.api.service;

import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.hanbit.there.api.dao.MemberDAO;
import com.hanbit.there.api.exception.HanbitException;
import com.hanbit.there.api.vo.MemberVO;

@Service
public class MemberService {

	private static final char[] CHARS = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789".toCharArray();

	@Autowired
	private MemberDAO memberDAO;
	@Autowired
	private PasswordEncoder passwordEncoder; // SecurityConfig 클래스에 빈 으로 등록 해놓음

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

}
