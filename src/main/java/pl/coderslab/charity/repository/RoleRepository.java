package pl.coderslab.charity.repository;


import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import pl.coderslab.charity.model.Role;
import pl.coderslab.charity.model.RoleType;

import java.util.List;


public interface RoleRepository extends JpaRepository<Role, Integer> {
//    Role findByName(String name);
    Role findByRoleType(RoleType roleType);
}
