package com.oneempower.auth.config;

import javax.annotation.security.PermitAll;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.config.annotation.authentication.configuration.AuthenticationConfiguration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;




@Configuration
@EnableWebSecurity
@ComponentScan("com.oneempower.auth")
@EnableJpaRepositories("com.oneempower.auth.repository")
public class WebSecurityConfig {

	@Autowired
	private AuthenticationConfiguration authConfiguration;

	@Bean
	public BCryptPasswordEncoder bCryptPasswordEncoder() {
		return new BCryptPasswordEncoder();
	}

//	@Bean
//	public SecurityFilterChain filterChain(HttpSecurity http) throws Exception {
//		http.csrf().disable().authorizeRequests().antMatchers("/resources/**", "/registration")
//		.permitAll()
//		.antMatchers("/view/**","/user/**","/customer/**","/upload/**","/home/**","/image/show","/image/imageDetails").hasRole("ADMIN")
//		.antMatchers("/view/**","/customer/**").hasAnyRole("USER", "ADMIN")
//				.anyRequest().authenticated()
//				.and().formLogin()
//				.loginPage("/login")
//				.defaultSuccessUrl("/")
//				.permitAll()
//				.and()
//				.logout()
//				.permitAll();
//
//		return http.build();
//	}
	
	@Bean
	public SecurityFilterChain finterChain(HttpSecurity http) throws Exception {

		http.csrf().disable();

		// Các trang không yêu cầu login
		http.authorizeRequests().antMatchers("/", "/resources/**", "/registration").permitAll();
		http.authorizeRequests().antMatchers("/hooks/**", "/jsp/**", "/data/**", "/layouts/**", "/pages/**", "/public/**", "/router/**", "/styles/**", "/sub-components/**", "/widgets/**").permitAll();

		// Trang /userInfo yêu cầu phải login với vai trò ROLE_USER hoặc ROLE_ADMIN.
		// Nếu chưa login, nó sẽ redirect tới trang /login.
		http.authorizeRequests().antMatchers("/view/**","/customer/**","/image/**","/app").access("hasAnyRole('ROLE_USER', 'ROLE_ADMIN')");

		// Trang chỉ dành cho ADMIN
		http.authorizeRequests().antMatchers("/view/**","/user/**","/customer/**","/upload/**","/image/**","/app").access("hasRole('ROLE_ADMIN')");

		// Khi người dùng đã login, với vai trò XX.
		// Nhưng truy cập vào trang yêu cầu vai trò YY,
		// Ngoại lệ AccessDeniedException sẽ ném ra.
		http.authorizeRequests().and().exceptionHandling().accessDeniedPage("/403");

		// Cấu hình cho Login Form.
		http.authorizeRequests().anyRequest().authenticated()
		.and().formLogin()//
				// Submit URL của trang login
				.loginPage("/login")//
				.defaultSuccessUrl("/")//
				.permitAll()
				// Cấu hình cho Logout Page.
				.and().logout().permitAll();
		return http.build();

	}


	@Bean
	public AuthenticationManager authenticationManager() throws Exception {
		return authConfiguration.getAuthenticationManager();
	}
}