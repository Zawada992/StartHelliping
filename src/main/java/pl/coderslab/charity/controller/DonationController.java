package pl.coderslab.charity.controller;

import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import pl.coderslab.charity.model.Category;
import pl.coderslab.charity.model.Donation;
import pl.coderslab.charity.model.Institution;
import pl.coderslab.charity.service.CategoryService;
import pl.coderslab.charity.service.DonationService;
import pl.coderslab.charity.service.InstitutionService;
import pl.coderslab.charity.service.UserService;

import javax.validation.Valid;
import java.util.List;

@Controller
public class DonationController {

    private final DonationService donationService;
    private final CategoryService categoryService;
    private final InstitutionService institutionService;
    private final UserService userService;

    public DonationController(DonationService donationService, CategoryService categoryService, InstitutionService institutionService, UserService userService) {
        this.donationService = donationService;
        this.categoryService = categoryService;
        this.institutionService = institutionService;
        this.userService = userService;
    }

    @RequestMapping(value = "/form", method = RequestMethod.GET)
    public String formDonation(Model model, Authentication auth){
        List<Category> categories = categoryService.getAllCategory();
        List<Institution> institutions = institutionService.getAllInst();
        model.addAttribute("categories", categories);
        model.addAttribute("donation", new Donation());
        model.addAttribute("institution", institutions);
        model.addAttribute("currentUser", userService.findByUserEmail(auth.getName()));
        return "form/form";

    }
    @RequestMapping(value = "/form", method = RequestMethod.POST)
    public String saveformDonation(@Valid @ModelAttribute("donation")
                                            Donation donation, BindingResult result) {
        if (result.hasErrors()) {
            return "form/form";
        }
        donationService.add(donation);
        return "form/form";
    }
    @GetMapping("/admin/donation")
    public String getUserDonations(Model model){
        List<Donation> donations = donationService.getAll();
        model.addAttribute("donation", donations);
        return "donation/donationUser";
    }

    @GetMapping("/donation/details/{id}")
    public String showDetails(Model model, @PathVariable Long id){
        Donation donations = donationService.getById(id);
        model.addAttribute("donation", donations);
        return "donation/donationDetails";

    }




}
