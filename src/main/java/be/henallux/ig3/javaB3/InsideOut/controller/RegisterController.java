package be.henallux.ig3.javaB3.InsideOut.controller;

import be.henallux.ig3.javaB3.InsideOut.dataAccess.dao.CategoryDataAccess;
import be.henallux.ig3.javaB3.InsideOut.dataAccess.dao.UserDataAccess;
import be.henallux.ig3.javaB3.InsideOut.model.OrderLine;
import be.henallux.ig3.javaB3.InsideOut.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import javax.validation.Valid;
import java.util.HashMap;

@Controller
@RequestMapping(value = "/register")
@SessionAttributes({Constants.CURRENT_CART})
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
        if (!model.containsAttribute("cart"))
            model.addAttribute("cart",new HashMap<Integer, OrderLine>());

        return "integrated:register";
    }

    @RequestMapping(value = "/send", method = RequestMethod.POST)
    public String getFormData (@Valid @ModelAttribute (value = "user") User userForm,
                               BindingResult errors) {
        if(!errors.hasErrors()){
            if (userForm.getPassword().equals(userForm.getConfirmationPassword())) {
                BCryptPasswordEncoder bCryptPasswordEncoder = new BCryptPasswordEncoder();
                userForm.setPassword(bCryptPasswordEncoder.encode(userForm.getPassword()));

                userForm.setAccountNonLocked(true);
                userForm.setAccountNonExpired(true);
                userForm.setEnabled(true);
                userForm.setCredentialsNonExpired(true);
                userForm.setAuthorities("ROLE_USER");

                try {
                    userDataAccess.save(userForm);
                } catch (Exception e) {
                    errors.rejectValue("username", "username.taken");

                    userForm.setPassword("");
                    userForm.setConfirmationPassword("");

                    return "integrated:register";
                }
                return "integrated:home";
            }
            else {
                errors.rejectValue("password", "nomatch.password");
                return "integrated:register";
            }
        } else {
            return "integrated:register";
        }
    }
}
