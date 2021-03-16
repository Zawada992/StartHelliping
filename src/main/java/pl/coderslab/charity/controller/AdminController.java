package pl.coderslab.charity.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import pl.coderslab.charity.model.RoleType;
import pl.coderslab.charity.model.User;
import pl.coderslab.charity.service.UserService;

import javax.validation.Valid;
import java.util.List;

@Controller
@RequestMapping("/admin/user")
public class AdminController {
    private final UserService userService;

    public AdminController(UserService userService) {
        this.userService = userService;
    }

    @GetMapping("/admins")
    public String showAllAdmin(Model model) {
        model.addAttribute("admins", userService.findAllByRoleType(RoleType.ROLE_ADMIN));
        return "admins/adminsAll";
    }


    @GetMapping("/all")
    public String showAllUsers(Model model) {
        List<User> users = userService.getUsers();
        model.addAttribute("user", users);
        return "user/allUser";
    }

    @RequestMapping(value = "/edit/{id}")
    public String editUser (Model model, @PathVariable Long id){
        model.addAttribute("user", userService.get(id));
        return "user/editUserAdmin";
    }
    @RequestMapping(value = "/edit", method = RequestMethod.POST)
    public String saveEditUser (@Valid @ModelAttribute("user") User user,
                                BindingResult result){
        if(result.hasErrors()){
            return "user/editUserAdmin";
        }
        userService.add(user);
        return "redirect:/admin/user/all";
    }

    @RequestMapping("/delete/{id}")
    public String deleteUser(@PathVariable long id){
        userService.delete(id);
        return "redirect:/admin/user/all";

    }
}
