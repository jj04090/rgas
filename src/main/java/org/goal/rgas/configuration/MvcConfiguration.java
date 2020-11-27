package org.goal.rgas.configuration;

import org.goal.rgas.interceptor.AdminInterceptor;
import org.goal.rgas.interceptor.CommonInterceptor;
import org.goal.rgas.interceptor.LoginInterceptor;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class MvcConfiguration implements WebMvcConfigurer {
	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		registry.addInterceptor(new LoginInterceptor())
				.addPathPatterns("/donation/**", "/member/**", "/mission/**", "/payment/**", "/perform/**",
						"/refunds/**", "/reports/**")
				.excludePathPatterns("/member/form", "/configuration/**", "/system/**", "/interceptor/**",
						"/emailcertification/**", "/member");

		registry.addInterceptor(new AdminInterceptor()).addPathPatterns("/donation/**", "/perform/*", "/report/*",
				"/charity/**");

		registry.addInterceptor(new CommonInterceptor()).addPathPatterns("/mission/**", "/perform/form/*", "/perform",
				"/report/form/*");
	}
}
