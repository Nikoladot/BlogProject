package cubes.main.security;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;



@Configuration
@EnableWebSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter{

	@Autowired
	private DataSource myDataSource;
	
	@Override
	protected void configure(AuthenticationManagerBuilder auth) throws Exception {
		
		auth.jdbcAuthentication().dataSource(myDataSource);
		
	}
	
	@Override
	protected void configure(HttpSecurity http) throws Exception {
		
		
		http.authorizeRequests()
		.antMatchers("/").permitAll()
		.antMatchers("/api/**").permitAll()
		.antMatchers("/dist/**").permitAll()
		.antMatchers("/css/**").permitAll()
		.antMatchers("/plugins/**").permitAll()
		.antMatchers("/administration/**").hasAnyRole("admin, bloger")
		.and()
		.formLogin().loginPage("/loginPage")
		.loginProcessingUrl("/authenticateTheUser").defaultSuccessUrl("/administration/").permitAll().and().csrf().disable();
		
	}
	
	
}
