package com.photo.photoblog.dao;

import com.photo.photoblog.model.PhotoHistory;
import com.photo.photoblog.model.Users;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface PhotoHistoryRepository extends JpaRepository<PhotoHistory, Long> {

    public List<PhotoHistory> findAll();

    List<PhotoHistory> findAllByUsers(Users users);



}
