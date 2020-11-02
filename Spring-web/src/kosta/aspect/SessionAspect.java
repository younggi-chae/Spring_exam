package kosta.aspect;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;

@Aspect
public class SessionAspect {
	
	@Around("execution(public * kosta.controller.*.*do(..))")
	public String sessionCheck(ProceedingJoinPoint joinPoint) throws Throwable{
		//세션 유무 체크
		Object[] obj = joinPoint.getArgs();
		HttpServletRequest request = (HttpServletRequest)obj[0];
		HttpSession session = request.getSession();
		
		String name = (String)session.getAttribute("name");
		String view = "session/session_fail";
		
		try {
			if(name == null){
				throw new Exception("no session");
			}
			
		view = (String)joinPoint.proceed(); //session_do() 호출
			
		} catch (Exception e) {
			return view;
		}
		
		return view;
	}
	
	
}
