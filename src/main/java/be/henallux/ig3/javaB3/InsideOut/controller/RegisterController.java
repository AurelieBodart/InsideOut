package be.henallux.ig3.javaB3.InsideOut.controller;

import be.henallux.ig3.javaB3.InsideOut.dataAccess.dao.UserDataAccess;
import be.henallux.ig3.javaB3.InsideOut.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

@Controller
@RequestMapping(value = "/register")
public class RegisterController {

    private UserDataAccess userDataAccess;

    @Autowired
    public RegisterController(UserDataAccess userDataAccess){
        this.userDataAccess = userDataAccess;
    }

    @RequestMapping(method = RequestMethod.GET)
    public String home(Model model) {
        model.addAttribute("title", "Inscription");
        model.addAttribute("user", new User());
        return "integrated:register";
    }

    @RequestMapping(value = "/send", method = RequestMethod.POST)
    public String getFormData (@ModelAttribute (value = "user") User userForm) {
        BCryptPasswordEncoder bCryptPasswordEncoder = new BCryptPasswordEncoder();
        userForm.setPassword(bCryptPasswordEncoder.encode(userForm.getPassword()));

        userForm.setAccountNonLocked(true);
        userForm.setAccountNonExpired(true);
        userForm.setEnabled(true);
        userForm.setCredentialsNonExpired(true);
        userForm.setAuthorities("ROLE_USER");

        userDataAccess.save(userForm);

        return "integrated:home";
    }
}
