package pl.coderslab.charity.controller;

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

import javax.validation.Valid;
import java.util.List;

@Controller
public class DonationController {

    private final DonationService donationService;
    private final CategoryService categoryService;
    private final InstitutionService institutionService;

    public DonationController(DonationService donationService, CategoryService categoryService, InstitutionService institutionService) {
        this.donationService = donationService;
        this.categoryService = categoryService;
        this.institutionService = institutionService;
    }

    @RequestMapping(value = "/app/form", method = RequestMethod.GET)
    public String formDonation(Model model){
        List<Category> categories = categoryService.getAllCategory();
        List<Institution> institutions = institutionService.getAllInst();
        model.addAttribute("categories", categories);
        model.addAttribute("donation", new Donation());
        model.addAttribute("institution", institutions);
        return "form/form";

    }
    @RequestMapping(value = "/app/form", method = RequestMethod.POST)
    public String saveformDonation(@Valid @ModelAttribute("donation")
                                            Donation donation, BindingResult result) {
        if (result.hasErrors()) {
            return "form/form";
        }
        donationService.add(donation);
        return "redirect:/app/home";
    }
    @GetMapping("/app/donation")
    public String getUserDonations(Model model){
        List<Donation> donations = donationService.getAll();
        model.addAttribute("donation", donations);
        return "donation/donationUser";

    }
    @GetMapping("/app/donation/details/{id}")
    public String showDetails(Model model, @PathVariable Long id){
        Donation donations = donationService.getById(id);
        model.addAttribute("donation", donations);
        return "donation/donationDetails";

    }




}
