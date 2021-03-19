package pl.coderslab.charity.service;

import org.springframework.stereotype.Service;
import pl.coderslab.charity.model.Donation;
import pl.coderslab.charity.model.Institution;
import pl.coderslab.charity.model.User;
import pl.coderslab.charity.repository.DonationRepository;

import javax.swing.text.html.Option;
import java.time.LocalDate;
import java.time.LocalTime;
import java.util.List;
import java.util.Optional;

@Service
public class DonationServiceImpl implements DonationService{

    private final DonationRepository donationRepository;

    public DonationServiceImpl(DonationRepository donationRepository) {
        this.donationRepository = donationRepository;
    }

    @Override
    public void add(Donation donation) {
        donationRepository.save(donation);
    }

    @Override
    public void delete(Long id) {
        donationRepository.deleteById(id);
    }

    @Override
    public List<Donation> getAll() {
        return donationRepository.findAll();
    }


    @Override
    public Donation getById(Long id) {
        return donationRepository.findById(id).get();
    }

    @Override
    public Long getSumBags() {
        return donationRepository.getSumBags().orElse(0L);
    }

    @Override
    public Long countDonations() {
        return donationRepository.countDonations();
    }

    @Override
    public List<Donation> findAllByInstitution(Institution institution) {
        return donationRepository.findAllByInstitution(institution);
    }

    @Override
    public List<Donation> findAllByUser(User user) {
        return donationRepository.findAllByUser(user);
    }

    @Override
    public void switchTaken(Long donationId) {
        Donation donation = getById(donationId);
        donation.setTaken(!donation.isTaken());
        donation.setPickedUpDate(LocalDate.now());
        donation.setPickedUpTime(LocalTime.now());
        add(donation);
    }


}
