package pl.coderslab.charity.controller;


import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import pl.coderslab.charity.model.User;
import pl.coderslab.charity.service.UserService;
import pl.coderslab.charity.utils.PasswordUtils;

import javax.validation.Valid;

@Controller
@RequestMapping("/app/user")
public class UserController {
    private final UserService userService;
   private final PasswordUtils passwordUtils;


    public UserController(UserService userService, PasswordUtils passwordUtils) {
        this.userService = userService;
        this.passwordUtils = passwordUtils;
    }

//    @GetMapping("/user/all")
//    public String showAllUsers(Model model) {
//        List<User> users = userService.getUsers();
//        model.addAttribute("user", users);
//        return "user/allUser";
//    }


    @GetMapping("/edit" )
    public String editUser (Model model, Authentication auth){
        User currentUser = userService.findByUserEmail(auth.getName());
        Long id = currentUser.getId();
        model.addAttribute("users", userService.get(id));
        return "user/editUser";
    }

//    @RequestMapping(value = "/update", method = RequestMethod.POST)
    @PostMapping("/update")
    public String saveEditUser (@Valid @ModelAttribute("users") User users, BindingResult result){
        if(result.hasErrors()){
            return "user/editUser";
        }
        userService.add(users);
        return "redirect:/app/home";
    }
    @GetMapping("/profile/change-pass")
    public String userChangePassGet( Model model, Authentication auth){
        User currentUser = userService.findByUserEmail(auth.getName());
        Long id = currentUser.getId();
        model.addAttribute("user", userService.get(id));
        return "change/changePassword";
    }

    @PostMapping("/profile/change-pass")
    public String userChangePassPost(
            Authentication auth,
            @RequestParam(name = "oldPassword") String oldPassword,
            @RequestParam(name = "newPassword") String newPassword,
            @RequestParam(name = "confirmPassword") String confirmPassword,
            Model model
    ) {
        User user = userService.findByUserEmail(auth.getName());
        if(passwordUtils.checkOldPassword(user, oldPassword) && passwordUtils.isPassword(newPassword, confirmPassword)) {
            user.setPassword(newPassword);
            userService.saveUserPassword(user);
            return "redirect:/app/home";
        }else {
            model.addAttribute("user", user);
            return "profile/changePasswdFail";
        }
    }



    @RequestMapping("/delete")
    public String deleteUser(Authentication auth){
        User currentUser = userService.findByUserEmail(auth.getName());
        Long id = currentUser.getId();
        userService.delete(id);
        return "index";
    }

}
