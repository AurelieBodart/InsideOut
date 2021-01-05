package be.henallux.ig3.javaB3.InsideOut.controller;

import be.henallux.ig3.javaB3.InsideOut.dataAccess.dao.CategoryDataAccess;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value = "/about")
public class AboutController extends SuperController {
    public AboutController(CategoryDataAccess categoryDataAccess) {
        super(categoryDataAccess);
    }

    @RequestMapping(method = RequestMethod.GET)
    public String aboutPage(Model model) {
        model.addAttribute("title", "About page");

        return "static:about";
    }
}
