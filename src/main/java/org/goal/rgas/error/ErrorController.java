package org.goal.rgas.error;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;

import org.springframework.http.HttpStatus;
import org.springframework.http.HttpStatus.Series;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

@RestController
@RequestMapping("/error")
public class ErrorController {
	private String VIEW_PATH = "/errors/";
	
	@GetMapping
	public ModelAndView handleError(HttpServletRequest request) { 
		ModelAndView mv = new ModelAndView();
		mv.setViewName(VIEW_PATH + "404");
		
		Object status = request.getAttribute(RequestDispatcher.ERROR_STATUS_CODE); 
		if(status != null){ 
			int statusCode = Integer.valueOf(status.toString()); 
			if(statusCode == HttpStatus.NOT_FOUND.value()){ 
				mv.setViewName(VIEW_PATH + "404");
				
				return mv; 
					
			} if(statusCode == HttpStatus.FORBIDDEN.value()){ 
				mv.setViewName(VIEW_PATH + "500");
				
				return mv; 
			} if(statusCode == HttpStatus.METHOD_NOT_ALLOWED.value()){ 
				mv.setViewName(VIEW_PATH + "405");
				
				return mv; 
			} 
		} 
		
		return mv; 
	}
}
