package pl.coderslab.charity;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

@Configuration
@EnableWebSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter {

    @Bean
    public SpringDataUserDetailsService customUserDetailsService() {
        return new SpringDataUserDetailsService();
    }

    @Bean
    public BCryptPasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }

    @Bean
    public AuthenticationSuccessHandler myAuthenticationSuccessHandler(){
        return new MySimpleUrlAuthenticationSuccessHandler();
    }

    @Override
    protected void configure(HttpSecurity http) throws Exception {

        http.authorizeRequests()
                .antMatchers("/admin/**").hasAnyRole("ADMIN")
                .antMatchers("/app/**").hasAnyRole("USER")
                .antMatchers("/form").authenticated()
                .anyRequest().permitAll()
                .and().formLogin().usernameParameter("email").loginPage("/login")
                .successHandler(myAuthenticationSuccessHandler())
                .and().logout().logoutSuccessUrl("/")
                .permitAll();

    }

}