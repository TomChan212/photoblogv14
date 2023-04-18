package com.photo.photoblog.dao;

import com.photo.photoblog.dao.UserRepository;
import org.jvnet.hk2.annotations.Service;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

@Service
public class UserService {
    @Autowired
    UserRepository userRepository;
    @Autowired
    private BCryptPasswordEncoder passwordEncoder;

//    public boolean checkUsername() {
//        String username = "admin";
//        if(userRepository.findByUsername(username) != null) {
//            return true;
//        }
//        return false;
//    }
//    public void registerAdmin() {
//        if(checkUsername() == false) {
//            Users users = new Users();
//            users.setUsername("admin");
//            users.setPassword(passwordEncoder.encode("admin"));
//            users.setRole("ROLE_ADMIN");
//            userRepository.save(users);
//        }
//        else {
//            System.out.println("admin already exists");
//        }
//    }
}
