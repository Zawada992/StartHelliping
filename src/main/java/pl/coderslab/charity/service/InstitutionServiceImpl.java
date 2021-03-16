package pl.coderslab.charity.service;

import org.springframework.stereotype.Service;
import pl.coderslab.charity.model.Institution;
import pl.coderslab.charity.repository.InstitutionRepository;

import java.util.List;

@Service
public class InstitutionServiceImpl implements InstitutionService{

    private final InstitutionRepository institutionRepository;

    public InstitutionServiceImpl(InstitutionRepository institutionRepository) {
        this.institutionRepository = institutionRepository;
    }

    @Override
    public List<Institution> getAllInst() {
        return institutionRepository.findAll();
    }

    @Override
    public void add(Institution institution) {
        institutionRepository.save(institution);
    }

    @Override
    public void delete(Institution institution) {
        institutionRepository.delete(institution);
    }

    @Override
    public Institution get(Long id) {
        return institutionRepository.findById(id).orElseThrow(()->new IllegalArgumentException("Institution does not exists"));
    }
}
