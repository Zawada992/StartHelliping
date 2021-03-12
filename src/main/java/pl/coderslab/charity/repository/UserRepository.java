package pl.coderslab.charity.repository;



import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import pl.coderslab.charity.model.User;



public interface UserRepository extends JpaRepository<User, Long> {
    User findByEmail (String email);
//    User findByUserName(String userName);
//    User findByVerifyCode(String verifyCode);
}
