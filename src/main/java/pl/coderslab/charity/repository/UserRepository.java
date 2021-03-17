package pl.coderslab.charity.repository;



import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import pl.coderslab.charity.model.Role;
import pl.coderslab.charity.model.Users;

import java.util.List;


public interface UserRepository extends JpaRepository<Users, Long> {
    Users findByEmail (String email);
//    User findByUserName(String userName);
//    User findByVerifyCode(String verifyCode);
    @Query("select u from Users u where ?1 member of u.roles")
    List<Users> findAllByRoleType(Role Role);
}
