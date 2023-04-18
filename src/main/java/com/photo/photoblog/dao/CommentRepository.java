package com.photo.photoblog.dao;

import com.photo.photoblog.model.Comment;
import com.photo.photoblog.model.Photo;
import com.photo.photoblog.model.Users;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface CommentRepository extends JpaRepository<Comment, Long> {
    List<Comment> findAllByPhoto(Photo photo);

    List<Comment> findAllByPhotoId(Long photoId);

    List<Comment> findAllByUsers(Users users);
}
