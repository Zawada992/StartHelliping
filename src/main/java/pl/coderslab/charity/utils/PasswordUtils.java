package pl.coderslab.charity.utils;

import pl.coderslab.charity.model.User;

public interface PasswordUtils {
    boolean checkOldPassword(User user, String oldPassword);
    boolean isPassword (String newPassword, String confirmPassword);
}
