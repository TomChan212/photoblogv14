package com.photo.photoblog.controller;

import com.photo.photoblog.model.Comment;
import com.photo.photoblog.model.Photo;
import com.photo.photoblog.model.Users;
import com.photo.photoblog.dao.CommentRepository;
import com.photo.photoblog.dao.PhotoRepository;
import com.photo.photoblog.dao.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@RestController
@RequestMapping("/admin")
public class AdminController {

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private PhotoRepository photoRepository;

    @Autowired
    private CommentRepository commentRepository;

    @GetMapping("adminIndex")
    public ModelAndView adminHome(Model model) {
        List<Users> users = userRepository.findAll();
        List<Photo> photo = photoRepository.findAll();
        List<Comment> comment = commentRepository.findAll();

        model.addAttribute("users", users);
        model.addAttribute("photo", photo);
        model.addAttribute("comment", comment);

        return new ModelAndView("/adminIndex");
    }

    @GetMapping("/editUser/{id}")
    public ModelAndView editUser(@PathVariable("id") Long id, Model model) {
        Users users = userRepository.findById(id).orElseThrow(() -> new IllegalArgumentException("Invalid user Id:" + id));
        model.addAttribute("users", users);
        return new ModelAndView("/editUser");
    }
    @PostMapping("editUser/{id}/update")
    public ModelAndView updateUser(Users users, Model model) {
        userRepository.save(users);
        return new ModelAndView("redirect:/admin/adminIndex");
    }


}