package pl.coderslab.charity.utils;

import pl.coderslab.charity.model.Users;

public interface PasswordUtils {
    boolean checkOldPassword(Users user, String oldPassword);
    boolean isPassword (String newPassword, String confirmPassword);
}
