package com.spring.springGroupS.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class MessageController {

	@RequestMapping(value = "/message/{msgFlag}", method = RequestMethod.GET)
	public String getMessage(Model model, HttpSession session,
			@PathVariable String msgFlag,
			@RequestParam(name="mid", defaultValue = "", required = false) String mid,
			@RequestParam(name="idx", defaultValue = "", required = false) String idx
		) {
		
		if(msgFlag.equals("hoewonInputOk")) {
			model.addAttribute("message", mid + "님 회원에 정상적으로 가입되었습니다.");
			model.addAttribute("url", "/study1/mapping/test35?mid="+mid);
		}
		else if(msgFlag.equals("hoewonInputNo")) {
			model.addAttribute("message", "회원 가입 실패");
			model.addAttribute("url", "/study1/mapping/menu");
		}
		else if(msgFlag.equals("userInputOk")) {
			model.addAttribute("message", "회원 가입 성공");
			model.addAttribute("url", "/user2/userList");
		}
		else if(msgFlag.equals("userInputNo")) {
			model.addAttribute("message", "회원 가입 실패");
			model.addAttribute("url", "/user2/userInput");
		}
		else if(msgFlag.equals("userDeleteOk")) {
			model.addAttribute("message", "회원 삭제 성공");
			model.addAttribute("url", "/user2/userList");
		}
		else if(msgFlag.equals("userDeleteNo")) {
			model.addAttribute("message", "회원 삭제 실패");
			model.addAttribute("url", "/user2/userList");
		}
		else if(msgFlag.equals("userUpdateOk")) {
			model.addAttribute("message", "회원 수정 성공");
			model.addAttribute("url", "/user2/userUpdate?idx="+idx);
		}
		else if(msgFlag.equals("userUpdateNo")) {
			model.addAttribute("message", "회원 수정 실패");
			model.addAttribute("url", "/user2/userUpdate?idx="+idx);
		}
		else if(msgFlag.equals("guestInputOk")) {
			model.addAttribute("message", "방명록 등록 성공");
			model.addAttribute("url", "/guest/guestInput");
		}
		else if(msgFlag.equals("guestInputNo")) {
			model.addAttribute("message", "방명록 등록 실패");
			model.addAttribute("url", "/guest/guestInput");
		}
		else if(msgFlag.equals("adminOk")) {
			model.addAttribute("message", "관리자 인증성공");
			model.addAttribute("url", "/guest/guestList");
		}
		else if(msgFlag.equals("adminNo")) {
			model.addAttribute("message", "관리자 인증 실패");
			model.addAttribute("url", "/guest/admin");
		}
		else if(msgFlag.equals("adminOut")) {
			model.addAttribute("message", "관리자 로그아웃");
			model.addAttribute("url", "/guest/guestList");
		}
		else if(msgFlag.equals("memberLoginOk")) {
			model.addAttribute("message", mid+"님 로그인 되셨습니다.");
			model.addAttribute("url", "/member/memberMain");
		}
		else if(msgFlag.equals("memberLoginNo")) {
			model.addAttribute("message", "로그인 실패~~");
			model.addAttribute("url", "/member/memberLogin");
		}
		else if(msgFlag.equals("guestDeleteOk")) {
			model.addAttribute("message", "방명록 삭제 성공");
			model.addAttribute("url", "/guest/guestList");
		}
		else if(msgFlag.equals("guestDeleteNo")) {
			model.addAttribute("message", "방명록 삭제 실패");
			model.addAttribute("url", "/guest/guestList");
		}
		else if(msgFlag.equals("mailSendOk")) {
			model.addAttribute("message", "메일 전송 성공");
			model.addAttribute("url", "/study1/mail/mailForm");
		}
		else if(msgFlag.equals("fileUploadOk")) {
			model.addAttribute("message", "파일 업로드 성공");
			model.addAttribute("url", "/study1/fileUpload/fileUploadForm");
		}
		else if(msgFlag.equals("fileUploadNo")) {
			model.addAttribute("message", "파일 업로드 실패");
			model.addAttribute("url", "/study1/fileUpload/fileUploadForm");
		}
		else if(msgFlag.equals("idCheckNo")) {
			model.addAttribute("message", "사용중인 아이디입니다.");
			model.addAttribute("url", "/member/memberJoin");
		}
		else if(msgFlag.equals("nickNameCheckNo")) {
			model.addAttribute("message", "사용중인 닉네임입니다.");
			model.addAttribute("url", "/member/memberJoin");
		}
		else if(msgFlag.equals("memberJoinOk")) {
			model.addAttribute("message", "회원가입 성공");
			model.addAttribute("url", "/member/memberLogin");
		}
		else if(msgFlag.equals("memberJoinNo")) {
			model.addAttribute("message", "회원가입 실패");
			model.addAttribute("url", "/member/memberJoin");
		}
		else if(msgFlag.equals("loginError")) {
			model.addAttribute("message", "로그인후 사용하세요");
			model.addAttribute("url", "/member/memberJoin");
		}
		else if(msgFlag.equals("levelNo")) {
			model.addAttribute("message", "등급을 확인해주세요");
			model.addAttribute("url", "/member/memberMain");
		}
		else if(msgFlag.equals("passWordChangeOK")) {
			session.invalidate();
			model.addAttribute("message", "비밀번호를 변경했습니다. 다시 로그인해 주세요");
			model.addAttribute("url", "/member/memberLogin");
		}
		else if(msgFlag.equals("passWordChangeNO")) {
			model.addAttribute("message", "비밀번호 변경 실패");
			model.addAttribute("url", "/member/memberPwdCheck");
		}
		else if(msgFlag.equals("nickCheckNO")) {
			model.addAttribute("message", "사용중인 닉네임입니다.");
			model.addAttribute("url", "/member/memberUpdate?mid="+mid);
		}
		else if(msgFlag.equals("memberUpdateOk")) {
			model.addAttribute("message", "회원정보수정 완료");
			model.addAttribute("url", "/member/memberUpdate?mid="+mid);
		}
		else if(msgFlag.equals("memberUpdateNo")) {
			model.addAttribute("message", "회원정보수정 실패");
			model.addAttribute("url", "/member/memberUpdate?mid="+mid);
		}
		else if(msgFlag.equals("boardInputOk")) {
			model.addAttribute("message", "게시글 등록 완료");
			model.addAttribute("url", "/board/boardList");
		}
		else if(msgFlag.equals("boardInputNo")) {
			model.addAttribute("message", "게시글 등록 실패");
			model.addAttribute("url", "/board/boardInput");
		}
		
		
		return "include/message";
	}
	
}
