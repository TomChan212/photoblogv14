package com.photo.photoblog.dao;

import com.photo.photoblog.model.CommentHistory;
import com.photo.photoblog.model.Users;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface CommentHistoryRepository extends JpaRepository<CommentHistory, Long> {

    List<CommentHistory> findAllByUsers(Users users);
}
