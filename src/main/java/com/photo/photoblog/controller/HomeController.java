package com.photo.photoblog.controller;

import com.photo.photoblog.model.Comment;
import com.photo.photoblog.model.Photo;
import com.photo.photoblog.model.Users;
import com.photo.photoblog.dao.CommentRepository;
import com.photo.photoblog.dao.PhotoRepository;
import com.photo.photoblog.dao.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import java.security.Principal;
import java.util.List;

@Controller

public class HomeController {

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private PhotoRepository photoRepository;

    @Autowired
    private PasswordEncoder passwordEncoder;
    @Autowired
    private CommentRepository commentRepository;

    @GetMapping("/")
    public String home(Model model) {
        List<Photo> photos = photoRepository.findAll();
        model.addAttribute("photos", photos);
        return "index";
    }

    @GetMapping("/register")
    public ModelAndView register(Model model){
        //userService.register(model);
        model.addAttribute("users", new Users());
        ModelAndView mav = new ModelAndView("/register");
        return mav;
    }
    @GetMapping("/photos/{id}")
    public String showPhoto(@PathVariable Long id, Model model, Principal principal) {
        //String currentUserEmail = principal.getName();
        //Users users = userRepository.findByEmail(currentUserEmail);
        //model.addAttribute("users", users);
        Photo photo = photoRepository.findById(id).orElse(null);
        model.addAttribute("photo", photo);
        Long photo_id = photo.getId();
        List<Comment> comment = commentRepository.findAllByPhotoId(photo_id);
        model.addAttribute("comments", comment);
        return "photoPage";
    }
    @PostMapping("/registerSuccess")
    public ModelAndView register_success(Users users, Model model, Principal principal) {
            //userService.registerSuccess(users);
            users.setRole("ROLE_USER");
            users.setPassword(passwordEncoder.encode(users.getPassword()));
            userRepository.save(users);
            if(principal != null){
                ModelAndView mav = new ModelAndView("redirect:/admin/adminIndex");
                return mav;
            }
            else{
                ModelAndView mav = new ModelAndView("redirect:/login");
                return mav;
            }

    }

    @GetMapping("/login")
    public String login(Model model) {
        return "login";
    }

}