package pl.coderslab.charity.service;



import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import pl.coderslab.charity.model.Role;
import pl.coderslab.charity.model.RoleType;
import pl.coderslab.charity.model.User;
import pl.coderslab.charity.repository.RoleRepository;
import pl.coderslab.charity.repository.UserRepository;



import java.util.Arrays;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

@Service
public class UserServiceImpl implements UserService {

    private final UserRepository userRepository;
    private final BCryptPasswordEncoder passwordEncoder;
    private final RoleRepository roleRepository;
    private final  RoleService roleService;


    public UserServiceImpl(UserRepository userRepository, BCryptPasswordEncoder passwordEncoder, RoleRepository roleRepository, RoleService roleService) {
        this.userRepository = userRepository;
        this.passwordEncoder = passwordEncoder;
        this.roleRepository = roleRepository;
        this.roleService = roleService;
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
        user.setEnabled(true);
        user.setPassword(passwordEncoder.encode(user.getPassword()));
        user.setRoles(Set.of(roleService.findByRoleType(RoleType.ROLE_USER)));
        userRepository.save(user);
    }
    @Override
    public void saveUserPassword (User user){
        user.setPassword(passwordEncoder.encode(user.getPassword()));
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



    @Override
    public List<User> findAllByRoleType(RoleType roleType) {
        Role role = roleService.findByRoleType(roleType);
        return userRepository.findAllByRoleType(role);
    }


}
