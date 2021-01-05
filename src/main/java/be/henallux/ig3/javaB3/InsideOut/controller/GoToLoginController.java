package be.henallux.ig3.javaB3.InsideOut.controller;

import be.henallux.ig3.javaB3.InsideOut.dataAccess.dao.CategoryDataAccess;
import be.henallux.ig3.javaB3.InsideOut.model.OrderLine;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import java.util.HashMap;

@Controller
@RequestMapping(value="/goToLogin")
@SessionAttributes({Constants.CURRENT_CART})
public class GoToLoginController extends SuperController {
    @Autowired
    public GoToLoginController(CategoryDataAccess categoryDataAccess) {
        super(categoryDataAccess);
    }

    @RequestMapping (method = RequestMethod.GET)
    public String login (Model model) {

        model.addAttribute("categories", super.getAllCategories());
        model.addAttribute("title", "Home page");
        if (!model.containsAttribute("cart"))
            model.addAttribute("cart",new HashMap<Integer, OrderLine>());

        return "integrated:home";
    }
}
