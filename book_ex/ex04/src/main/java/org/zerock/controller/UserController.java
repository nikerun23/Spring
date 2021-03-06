package org.zerock.controller;

import java.util.Date;

import javax.inject.Inject;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.util.WebUtils;
import org.zerock.domain.UserVO;
import org.zerock.dto.LoginDTO;
import org.zerock.service.UserService;

@Controller
@RequestMapping("/user")
public class UserController {

	@Inject
	UserService service;
	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public void loginGet(@ModelAttribute("dto") LoginDTO dto) {
		
	}
	
	@RequestMapping(value = "/loginPost", method = RequestMethod.POST)
	public void loginPOST(LoginDTO dto, HttpSession session, Model model) throws Exception {
	
		UserVO vo = service.login(dto);
		
		if (vo == null) {
		  return;
		}
		
		model.addAttribute("userVO", vo);
		
		if (dto.isUseCookie()) {
		
		  int amount = 60 * 60 * 24 * 7;
		
		  Date sessionLimit = new Date(System.currentTimeMillis() + (1000 * amount)); // 밀리세컨즈로 쿠키 유효기간설정
		
		  service.keepLogin(vo.getUid(), session.getId(), sessionLimit); // 로그인 쿠키를 DB에 저장
		}
		
	}
	
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public void logout(HttpServletRequest request, 
      HttpServletResponse response, HttpSession session) throws Exception {

		Object obj = session.getAttribute("login");

		if (obj != null) {
		  UserVO vo = (UserVO) obj;
		
		  session.removeAttribute("login");
		  session.invalidate();
		
		  Cookie loginCookie = WebUtils.getCookie(request, "loginCookie");
		
		  if (loginCookie != null) {
		    loginCookie.setPath("/");
		        loginCookie.setMaxAge(0);
		        response.addCookie(loginCookie);
		        service.keepLogin(vo.getUid(), session.getId(), new Date());
		      }
		    }
		}
	
}
