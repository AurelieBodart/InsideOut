package be.henallux.ig3.javaB3.InsideOut.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value="/login")
public class LoginController {

    @RequestMapping (method = RequestMethod.GET)
    public String home (Model model) {
        model.addAttribute("title", "Login page");
        //model.addAttribute("user", new User());
        return "integrated:login";
    }

    // pas besoin de post car spring sécurity gère tout seul
}
