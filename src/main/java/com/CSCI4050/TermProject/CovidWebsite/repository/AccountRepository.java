package com.CSCI4050.TermProject.CovidWebsite.repository;


import com.CSCI4050.TermProject.CovidWebsite.entities.AccountEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.CrudRepository;

public interface AccountRepository extends CrudRepository<AccountEntity, Long> {
    //Optional<AccountEntity> findById(Long Id);
    AccountEntity findByUserName(String userName);
    AccountEntity findByPassword (String password);
    AccountEntity findByEmail (String email);
}