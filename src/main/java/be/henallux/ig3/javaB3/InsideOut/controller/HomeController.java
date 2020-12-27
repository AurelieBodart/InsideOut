package be.henallux.ig3.javaB3.InsideOut.controller;

import be.henallux.ig3.javaB3.InsideOut.dataAccess.dao.CategoryDataAccess;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value = "/")
public class HomeController extends  SuperController{

    @Autowired
    public HomeController(CategoryDataAccess categoryDataAccess) {
        super(categoryDataAccess);
    }

    @RequestMapping(method = RequestMethod.GET)
    public String home(Model model) {

        model.addAttribute("categories", super.getAllCategories());
        model.addAttribute("title", "Home page");

        return "integrated:home";
    }
}
