package pl.coderslab.charity.repository;



import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import pl.coderslab.charity.model.Role;
import pl.coderslab.charity.model.User;

import java.util.List;


public interface UserRepository extends JpaRepository<User, Long> {
    User findByEmail (String email);
//    User findByUserName(String userName);
//    User findByVerifyCode(String verifyCode);
    @Query("select u from User u where ?1 member of u.roles")
    List<User> findAllByRoleType(Role Role);
}
