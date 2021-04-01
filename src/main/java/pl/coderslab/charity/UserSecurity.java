package pl.coderslab.charity;

import org.springframework.security.core.Authentication;
import pl.coderslab.charity.service.UserService;

public class UserSecurity {
    private final UserService userService;

    public UserSecurity(UserService userService) {
        this.userService = userService;
    }

//    public boolean isEnabled(Authentication authentication) {
//        return userService.findByUserEmail(authentication.getName()).isEnabled();
//    }
}
