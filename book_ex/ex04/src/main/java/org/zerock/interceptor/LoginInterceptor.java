package org.zerock.interceptor;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.ui.ModelMap;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import org.zerock.domain.UserVO;

public class LoginInterceptor extends HandlerInterceptorAdapter {

	private static final String LOGIN = "login";
	private static final Logger logger = LoggerFactory.getLogger(LoginInterceptor.class);
	
	@Override
	public void postHandle(HttpServletRequest request, 
	      HttpServletResponse response, Object handler,
	      ModelAndView modelAndView) throws Exception {

	    HttpSession session = request.getSession();

	    ModelMap modelMap = modelAndView.getModelMap();
	    Object userVO = modelMap.get("userVO");

	    if (userVO != null) {

	      logger.info("new login success");
	      session.setAttribute(LOGIN, userVO);

	      if (request.getParameter("useCookie") != null) { // useCookie 쿠키가 없으면 생성

	        logger.info("remember me................");
	        Cookie loginCookie = new Cookie("loginCookie", session.getId()); // 쿠키 생성
	        loginCookie.setPath("/");
	        loginCookie.setMaxAge(60 * 60 * 24 * 7); // 7일 보관
	        response.addCookie(loginCookie);
	      }
	      // response.sendRedirect("/");
	      Object dest = session.getAttribute("dest"); // 요청한 URL로 리다이렉트

	      response.sendRedirect(dest != null ? (String) dest : "/");
	    }
	}
	
	@Override
	public boolean preHandle(HttpServletRequest request
			, HttpServletResponse response
			, Object handler) {
		
		HttpSession session = request.getSession();
		
		if (session.getAttribute(LOGIN) != null) {
			logger.info("clear login data before........");
			session.removeAttribute(LOGIN);
		}
		
		return true;
	}
}
