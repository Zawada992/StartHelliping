package pl.coderslab.charity.service;

import pl.coderslab.charity.model.Role;
import pl.coderslab.charity.model.RoleType;

import java.util.List;
import java.util.Set;

public interface RoleService {
    Role findByRoleType(RoleType roleType);
    List<Role> findAll();
}
