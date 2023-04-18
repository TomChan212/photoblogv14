package com.photo.photoblog.dao;

import com.photo.photoblog.model.Photo;
import com.photo.photoblog.model.Users;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;


public interface PhotoRepository extends JpaRepository<Photo, Long> {

    public List<Photo> findAll();

    List<Photo> findAllByUsers(Users users);

}
