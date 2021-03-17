package pl.coderslab.charity.service;

import pl.coderslab.charity.model.Institution;

import java.util.List;

public interface InstitutionService {
    List<Institution> getAllInst();
    void add(Institution institution);
    void delete(Institution institution);
    Institution get(Long id);
}
