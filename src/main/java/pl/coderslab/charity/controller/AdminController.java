package pl.coderslab.charity.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import pl.coderslab.charity.model.Role;
import pl.coderslab.charity.model.RoleType;
import pl.coderslab.charity.model.Users;
import pl.coderslab.charity.service.RoleService;
import pl.coderslab.charity.service.UserService;

import javax.validation.Valid;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;

@Controller
@RequestMapping("/admin")
public class AdminController {
    private final UserService userService;
    private final RoleService roleService;

    public AdminController(UserService userService, RoleService roleService) {
        this.userService = userService;
        this.roleService = roleService;
    }

    @GetMapping("/all")
    public String showAllAdmin(Model model) {
        model.addAttribute("admins", userService.findAllByRoleType(RoleType.ROLE_ADMIN));
        model.addAttribute("roles", roleService.findAll());
        List<Boolean> bools = new ArrayList<>();
        bools.add(true);
        bools.add(false);
        model.addAttribute("enables", bools);
        return "admins/adminsAll";
    }

    @GetMapping("/take-off-permissions/{id}")
    public String takeOffPermissionsGet(@PathVariable Long id){
        Users user = userService.get(id);
        Role roleTypeAdmin = roleService.findByRoleType(RoleType.ROLE_ADMIN);
        Role roleTypeUser = roleService.findByRoleType(RoleType.ROLE_USER);

        Set<Role> roles = user.getRoles();
        roles.remove(roleTypeAdmin);
        roles.add(roleTypeUser);
        user.setRoles(roles);

        userService.add(user);

        return "redirect:/admin/all";
    }


    //---------User------------

    @GetMapping("/user/all")
    public String showAllUsers(Model model) {
        List<Users> users = userService.getUsers();
        model.addAttribute("user", users);
        return "user/allUser";
    }

    @RequestMapping(value = "/user/edit/{id}")
    public String editUser (Model model, @PathVariable Long id){
        model.addAttribute("user", userService.get(id));
        model.addAttribute("roles", roleService.findAll());
        List<Boolean> bools = new ArrayList<>();
        bools.add(true);
        bools.add(false);
        model.addAttribute("enables", bools);
        return "user/editUserAdmin";
    }

    @RequestMapping(value = "/user/edit", method = RequestMethod.POST)
    public String saveEditUser (@Valid @ModelAttribute("user") Users user,
                                BindingResult result){
        if(result.hasErrors()){
            return "user/editUserAdmin";
        }
        userService.add(user);
        return "redirect:/admin/user/all";
    }

    @RequestMapping("/user/delete/{id}")
    public String deleteUser(@PathVariable long id){
        userService.delete(id);
        return "redirect:/admin/user/all";
    }

    @GetMapping("/user/switch-enable/{id}")
    public String switchEnable(@PathVariable Long id){
        Users user = userService.get(id);
        user.setEnabled(!user.isEnabled());
        userService.add(user);
        return "redirect:/admin/user/all";
    }


}
