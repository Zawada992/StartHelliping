package pl.coderslab.charity.service;


import pl.coderslab.charity.model.Role;
import pl.coderslab.charity.model.RoleType;
import pl.coderslab.charity.model.User;

import java.util.List;

public interface UserService {
//    User findByUserName(String userName);
    User findByUserEmail(String email);
    void saveUser(User user);
    void add(User user);
    void delete(Long id);
    User get(Long id);
    List<User> getUsers();
    void saveUserPassword(User user);
    List<User> findAllByRoleType(RoleType roleType);

//    void sendVerificationEmail(User user,String siteURL);
//    void verifyAcc(String verifyCode);

}
