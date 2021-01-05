package be.henallux.ig3.javaB3.InsideOut.controller;

import be.henallux.ig3.javaB3.InsideOut.dataAccess.dao.CategoryDataAccess;
import be.henallux.ig3.javaB3.InsideOut.dataAccess.dao.OrderDataAccess;
import be.henallux.ig3.javaB3.InsideOut.model.Order;
import be.henallux.ig3.javaB3.InsideOut.model.OrderLine;
import be.henallux.ig3.javaB3.InsideOut.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import java.util.ArrayList;
import java.util.GregorianCalendar;
import java.util.HashMap;

@Controller
@RequestMapping(value = "/order")
@SessionAttributes({Constants.CURRENT_CART})
public class OrderController extends SuperController {
    private OrderDataAccess orderDataAccess;

    @Autowired
    public OrderController(CategoryDataAccess categoryDataAccess, OrderDataAccess orderDataAccess) {
        super(categoryDataAccess);
        this.orderDataAccess = orderDataAccess;
    }

    @RequestMapping(method = RequestMethod.GET)
    public String order(Model model,
                        @ModelAttribute(value = Constants.CURRENT_CART) HashMap<Integer, OrderLine> cart,
                        Authentication authentication) {
        model.addAttribute("categories", super.getAllCategories());

        if (cart.isEmpty())
            return "redirect:/cart";

        orderDataAccess.save(new Order(
                new ArrayList<>(cart.values()),
                new GregorianCalendar(),
                ((User) authentication.getPrincipal())));

        return "integrated:order";
    }

    @RequestMapping(method = RequestMethod.GET, value = "/success")
    public String success(Model model, @ModelAttribute(value = Constants.CURRENT_CART) HashMap<Integer, OrderLine> cart) {
        model.addAttribute("categories", super.getAllCategories());
        cart.clear();

        return "integrated:success";
    }
}
