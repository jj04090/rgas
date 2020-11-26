package org.goal.rgas.configuration;

import org.goal.rgas.interceptor.LoginInterceptor;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class MvcConfiguration implements WebMvcConfigurer {
	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		registry.addInterceptor(new LoginInterceptor())
		.addPathPatterns("/donation/**", "/member/**", "/mission/**", 
				"/payment/**", "/perform/**", "/refunds/**", "/reports/**")
		.excludePathPatterns("/member/form", "/configuration/**", 
				"/system/**", "/interceptor/**", "/emailcertification/**",
				"/member");
	}
}
