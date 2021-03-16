package pl.coderslab.charity.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import pl.coderslab.charity.model.Institution;
import pl.coderslab.charity.model.User;
import pl.coderslab.charity.service.DonationService;
import pl.coderslab.charity.service.InstitutionService;
import pl.coderslab.charity.service.UserService;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import java.util.List;


@Controller
public class HomeController {

    private final InstitutionService institutionService;
    private final DonationService donationService;
    private final UserService userService;

    public HomeController(InstitutionService institutionService, DonationService donationService, UserService userService) {
        this.institutionService = institutionService;
        this.donationService = donationService;
        this.userService = userService;
    }


    @RequestMapping("/")
    public String homeAction(Model model){
        List<Institution> institutions = institutionService.getAllInst();
        model.addAttribute("institution", institutions );
        model.addAttribute("bags", donationService.getSumBags());
        model.addAttribute("countDonations", donationService.countDonations());
        return "index";
    }
    @RequestMapping(value = {"/login"}, method = RequestMethod.GET)
    public String login() {
        return "login/login";
    }

    @GetMapping("/app/home")
    public String landingPage(){
        return "loginPage";
    }

//    @GetMapping("/user/all")
//    public String showAllUsers(Model model) {
//        List<User> users = userService.getUsers();
//        model.addAttribute("user", users);
//        return "user/allUser";
//    }
    @RequestMapping("/user/add")
    public  String addUser(Model model){
        model.addAttribute("user", new User());
        return "user/registration";
    }

    //    @RequestMapping(value = "/add", method = RequestMethod.POST)
    @PostMapping("/user/add")
    public String saveAddUser(@Valid User user, @RequestParam("password2") String password2) {
        if (!user.getPassword().equals(password2)) {
            return "user/registration";
        }


        userService.saveUser(user);
        return "redirect:/login";
    }

}
