package be.henallux.ig3.javaB3.InsideOut.controller;

import be.henallux.ig3.javaB3.InsideOut.dataAccess.dao.CategoryDataAccess;
import be.henallux.ig3.javaB3.InsideOut.dataAccess.dao.UserDataAccess;
import be.henallux.ig3.javaB3.InsideOut.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.validation.Valid;

@Controller
@RequestMapping(value = "/register")
public class RegisterController extends SuperController{

    private UserDataAccess userDataAccess;

    @Autowired
    public RegisterController(UserDataAccess userDataAccess, CategoryDataAccess categoryDataAccess){
        super(categoryDataAccess);
        this.userDataAccess = userDataAccess;
    }

    @RequestMapping(method = RequestMethod.GET)
    public String register(Model model) {

        model.addAttribute("categories", super.getAllCategories());
        model.addAttribute("title", "Register page");
        model.addAttribute("user", new User());

        return "integrated:register";
    }

    @RequestMapping(value = "/send", method = RequestMethod.POST)
    public String getFormData (@Valid @ModelAttribute (value = "user") User userForm,
                               final BindingResult errors) {
        if(!errors.hasErrors()){
            BCryptPasswordEncoder bCryptPasswordEncoder = new BCryptPasswordEncoder();
            userForm.setPassword(bCryptPasswordEncoder.encode(userForm.getPassword()));

            userForm.setAccountNonLocked(true);
            userForm.setAccountNonExpired(true);
            userForm.setEnabled(true);
            userForm.setCredentialsNonExpired(true);
            userForm.setAuthorities("ROLE_USER");

            userDataAccess.save(userForm);

            return "integrated:home";
        } else {
            return "integrated:register";
        }
    }
}
