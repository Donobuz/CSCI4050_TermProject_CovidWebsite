package com.CSCI4050.TermProject.CovidWebsite.Repository;


import com.CSCI4050.TermProject.CovidWebsite.Entities.AccountEntity;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

public interface AccountRepository extends JpaRepository<AccountEntity, Long> {
    Optional<AccountEntity> findById(Long Id);
}