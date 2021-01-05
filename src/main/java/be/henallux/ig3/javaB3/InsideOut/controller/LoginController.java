package be.henallux.ig3.javaB3.InsideOut.controller;

import be.henallux.ig3.javaB3.InsideOut.dataAccess.dao.CategoryDataAccess;
import be.henallux.ig3.javaB3.InsideOut.model.OrderLine;
import be.henallux.ig3.javaB3.InsideOut.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;

@Controller
@RequestMapping(value="/login")
@SessionAttributes({Constants.CURRENT_CART})
public class LoginController extends SuperController {

    @Autowired
    public LoginController(CategoryDataAccess categoryDataAccess) {
        super(categoryDataAccess);
    }

    @RequestMapping (method = RequestMethod.GET)
    public String login (Model model, @RequestParam (required = false, value = "error") String error) {
        model.addAttribute("categories", super.getAllCategories());
        model.addAttribute("title", "Login page");
        model.addAttribute("user", new User());

        if (!model.containsAttribute("cart")) {
            model.addAttribute("cart", new HashMap<Integer, OrderLine>());
        }

        if (error != null) {
            model.addAttribute("error", "error");
        }

        return "integrated:login";
    }
}
