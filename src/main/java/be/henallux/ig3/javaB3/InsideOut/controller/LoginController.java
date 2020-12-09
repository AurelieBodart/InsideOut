package be.henallux.ig3.javaB3.InsideOut.controller;

import be.henallux.ig3.javaB3.InsideOut.dataAccess.dao.CategoryDataAccess;
import be.henallux.ig3.javaB3.InsideOut.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value="/login")
public class LoginController extends SuperController {

    @Autowired
    public LoginController(CategoryDataAccess categoryDataAccess) {
        super(categoryDataAccess);
    }

    @RequestMapping (method = RequestMethod.GET)
    public String login (Model model) {

        model.addAttribute("categories", super.getAllCategories());
        model.addAttribute("title", "Login page");
        model.addAttribute("user", new User());

        return "integrated:login";
    }

    // pas besoin de post car spring sécurity gère tout seul
}
