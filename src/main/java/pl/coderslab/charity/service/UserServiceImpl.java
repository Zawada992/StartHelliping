package pl.coderslab.charity.service;



import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import pl.coderslab.charity.model.Role;
import pl.coderslab.charity.model.User;
import pl.coderslab.charity.repository.RoleRepository;
import pl.coderslab.charity.repository.UserRepository;



import java.util.Arrays;
import java.util.HashSet;
import java.util.List;

@Service
public class UserServiceImpl implements UserService {

    private final UserRepository userRepository;
    private final BCryptPasswordEncoder passwordEncoder;
    private final RoleRepository roleRepository;


    public UserServiceImpl(UserRepository userRepository, BCryptPasswordEncoder passwordEncoder, RoleRepository roleRepository) {
        this.userRepository = userRepository;
        this.passwordEncoder = passwordEncoder;
        this.roleRepository = roleRepository;
    }


//    @Override
//    public User findByUserName(String userName) {
//        return userRepository.findByUserName(userName);
//    }

    @Override
    public User findByUserEmail(String email) {
        return userRepository.findByEmail(email);
    }

    @Override
    public void saveUser(User user) {
        user.setPassword(passwordEncoder.encode(user.getPassword()));
        Role userRole = roleRepository.findByName("ROLE_USER");
        user.setRoles(new HashSet<Role>(Arrays.asList(userRole)));
        userRepository.save(user);
    }

    @Override
    public void add(User user) {
        userRepository.save(user);
    }

    @Override
    public void delete(Long id) {
        userRepository.deleteById(id);
    }

    @Override
    public User get(Long id) {
        return userRepository.findById(id).orElseThrow(()->new IllegalArgumentException("User does not exists"));
    }

    @Override
    public List<User> getUsers() {
        return userRepository.findAll();
    }



}
