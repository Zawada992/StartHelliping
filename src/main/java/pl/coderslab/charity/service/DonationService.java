package pl.coderslab.charity.service;


import pl.coderslab.charity.model.Donation;
import pl.coderslab.charity.model.Institution;
import pl.coderslab.charity.model.Users;

import javax.swing.text.html.Option;
import java.util.List;
import java.util.Optional;

public interface DonationService {
    void add(Donation donation);
    void  delete(Long id);
    List<Donation> getAll();
    Donation getById(Long id);
    Long getSumBags();
    Long countDonations();
    List<Donation> findAllByInstitution(Institution institution);
    List<Donation> findAllByUser(Users user);
    void switchTaken(Long donationId);

}
