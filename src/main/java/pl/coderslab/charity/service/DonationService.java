package pl.coderslab.charity.service;


import pl.coderslab.charity.model.Donation;
import pl.coderslab.charity.model.User;

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

}
