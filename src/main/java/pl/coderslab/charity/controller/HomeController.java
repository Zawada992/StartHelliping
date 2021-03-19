package pl.coderslab.charity.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import pl.coderslab.charity.model.Institution;

import pl.coderslab.charity.model.Users;
import pl.coderslab.charity.service.DonationService;
import pl.coderslab.charity.service.InstitutionService;
import pl.coderslab.charity.service.UserService;
import pl.coderslab.charity.token.ConfirmationToken;
import pl.coderslab.charity.token.ConfirmationTokenService;

import javax.validation.Valid;
import java.util.List;


@Controller
public class HomeController {

    private final InstitutionService institutionService;
    private final DonationService donationService;
    private final UserService userService;
    private final ConfirmationTokenService confirmationTokenService;

    public HomeController(InstitutionService institutionService, DonationService donationService, UserService userService, ConfirmationTokenService confirmationTokenService) {
        this.institutionService = institutionService;
        this.donationService = donationService;
        this.userService = userService;
        this.confirmationTokenService = confirmationTokenService;
    }
    @RequestMapping("/admin")
    public String adminPanel(Model model){
        return "panelAdmin";
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


    @RequestMapping("/user/add")
    public  String addUser(Model model){
        model.addAttribute("user", new Users());
        return "user/registration";
    }


    @PostMapping("/user/add")
    public String saveAddUser(@Valid Users user, @RequestParam("password2") String password2) {
        if (!user.getPassword().equals(password2)) {
            return "user/registration";
        }
        userService.saveUser(user);
        return "info/emailSend";
    }

    //CONFIRMATION FROM EMAIL
    @GetMapping("/register/confirm")
    public String registerConfirmGet(@RequestParam String token) {
        ConfirmationToken confirmationToken = confirmationTokenService.findByToken(token);
        Users user = confirmationToken.getUser();
        user.setEnabled(true);
        userService.add(user);
        confirmationTokenService.delete(confirmationToken);
        return "info/activation";
    }

    //FORGOT PASSWORD
    @GetMapping("/register/forgot-pass")
    public String enterMailGet() {
        return "info/forgotPassSetEmail";
    }

    @PostMapping("/register/forgot-pass")
    public String enterMailPost(@RequestParam String email) {
        Users user = userService.findByUserEmail(email);
        if (user == null) {
            return "info/emailNotFound";
        }
        userService.forgotPassword(user);
        return "info/newPassMailSend";
    }

    //FORGOT SET NEW PASSWORD
    @GetMapping("/register/forgot-pass/set-new")
    public String setNewPassGet(@RequestParam String token, Model model) {
        model.addAttribute("token", token);
        return "info/forgotPassSetNewPass";
    }

    @PostMapping("/register/forgot-pass/set-new")
    public String setNewPassPost(
            @RequestParam String token,
            @RequestParam String newPassword,
            @RequestParam String confirmPassword,
            Model model
    ) {
        ConfirmationToken confirmationToken;

        try {
            confirmationToken = confirmationTokenService.findByToken(token);
        } catch (IllegalStateException e) {
            return "info/notValidToken";
        }

        if (newPassword.equals(confirmPassword)) {
            Users user = confirmationToken.getUser();
            user.setPassword(newPassword);
            userService.saveUserPassword(user);
            confirmationTokenService.delete(confirmationToken);
            return "info/passwordChanged";
        } else {
            model.addAttribute("token", token);
            return "info/forgotPassSetNewPassFail";
        }
    }

}
