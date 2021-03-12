package pl.coderslab.charity.controller;


import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import pl.coderslab.charity.model.User;
import pl.coderslab.charity.service.UserService;

import javax.validation.Valid;
import java.util.List;

@Controller
@RequestMapping("/app/user")
public class UserController {
    private final UserService userService;

    public UserController(UserService userService) {
        this.userService = userService;
    }

//    @GetMapping("/user/all")
//    public String showAllUsers(Model model) {
//        List<User> users = userService.getUsers();
//        model.addAttribute("user", users);
//        return "user/allUser";
//    }
//
//    @RequestMapping("/user/add")
//    public  String addUser(Model model){
//        model.addAttribute("user", new User());
//        return "user/registration";
//    }
//
////    @RequestMapping(value = "/add", method = RequestMethod.POST)
//    @PostMapping("/user/add")
//    public String saveAddUser(@Valid User user, BindingResult result) {
//        if (result.hasErrors()) {
//            return "user/registration";
//        }
//        userService.add(user);
//        userService.saveUser(user);
//        return "redirect:/login";
//    }
//
    @RequestMapping(value = "/edit")
    public String editUser (Model model, Authentication auth){
        User currentUser = userService.findByUserEmail(auth.getName());
        Long id = currentUser.getId();
        model.addAttribute("user", userService.get(id));
        return "user/editUser";
    }

    @RequestMapping(value = "/edit", method = RequestMethod.POST)
    public String saveEditUser (@Valid @ModelAttribute("user") User user, BindingResult result){
        if(result.hasErrors()){
            return "user/editUser";
        }
        userService.add(user);
        return "redirect:/home";
    }

        @RequestMapping("/delete")
    public String deleteUser(Authentication auth){
        User currentUser = userService.findByUserEmail(auth.getName());
        Long id = currentUser.getId();
        userService.delete(id);
        return "index";
    }

}
