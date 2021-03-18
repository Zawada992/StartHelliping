package pl.coderslab.charity;

import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Component;
import pl.coderslab.charity.service.UserService;

@Component
public class UserSecurity {
    private final UserService userService;

    public UserSecurity(UserService userService) {
        this.userService = userService;
    }

    public boolean isEnabled(Authentication authentication) {
        return userService.findByUserEmail(authentication.getName()).isEnabled();
    }
}
