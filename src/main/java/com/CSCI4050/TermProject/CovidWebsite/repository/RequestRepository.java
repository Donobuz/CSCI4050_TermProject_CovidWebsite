package com.CSCI4050.TermProject.CovidWebsite.repository;

import java.util.Optional;
import com.CSCI4050.TermProject.CovidWebsite.entities.RequestEntity;
import org.springframework.data.repository.CrudRepository;

public interface RequestRepository extends CrudRepository<RequestEntity, Long> {

    Optional<RequestEntity> findById(Long Id);

    RequestEntity findByUserName(String userName);

    RequestEntity findByInstanceID(int instanceID);
}
