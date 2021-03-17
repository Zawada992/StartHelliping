package pl.coderslab.charity.service;


import pl.coderslab.charity.model.Role;
import pl.coderslab.charity.model.RoleType;
import pl.coderslab.charity.model.Users;

import java.util.List;

public interface UserService {

    Users findByUserEmail(String email);
    void saveUser(Users user);
    void add(Users user);
    void delete(Long id);
    Users get(Long id);
    List<Users> getUsers();
    void saveUserPassword(Users user);
    List<Users> findAllByRoleType(RoleType roleType);
    void forgotPassword(Users user);


}
