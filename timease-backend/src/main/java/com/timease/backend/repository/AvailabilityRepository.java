package com.timease.backend.repository;

import com.timease.backend.model.Availability;
import com.timease.backend.model.Event;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.UUID;

@Repository
public interface AvailabilityRepository extends JpaRepository<Availability, UUID> {
    List<Availability> findByEventId(UUID eventId);

}
