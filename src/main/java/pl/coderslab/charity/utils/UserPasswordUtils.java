package pl.coderslab.charity.utils;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Component;
import pl.coderslab.charity.model.Users;

@Component
public class UserPasswordUtils implements PasswordUtils{
    private final BCryptPasswordEncoder passwordEncoder;

    public UserPasswordUtils(BCryptPasswordEncoder passwordEncoder) {
        this.passwordEncoder = passwordEncoder;
    }
    @Override
    public boolean checkOldPassword(Users user, String oldPassword) {
        return passwordEncoder.matches(oldPassword, user.getPassword());
    }

    @Override
    public boolean isPassword(String newPassword, String confirmPassword) {
        return newPassword.equals(confirmPassword);
    }
}
