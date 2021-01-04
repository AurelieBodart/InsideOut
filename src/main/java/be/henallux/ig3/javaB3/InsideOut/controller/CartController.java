package be.henallux.ig3.javaB3.InsideOut.controller;

import be.henallux.ig3.javaB3.InsideOut.dataAccess.dao.CategoryDataAccess;
import be.henallux.ig3.javaB3.InsideOut.dataAccess.dao.ProductDataAccess;
import be.henallux.ig3.javaB3.InsideOut.model.OrderLine;
import be.henallux.ig3.javaB3.InsideOut.model.Product;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.stream.Collectors;

@Controller
@RequestMapping(value = "/cart")
@SessionAttributes({Constants.CURRENT_CART})
public class CartController extends SuperController {
    private ProductDataAccess productDataAccess;

    @ModelAttribute(Constants.CURRENT_CART)
    public HashMap<Integer, OrderLine> cart() {
        return new HashMap<>();
    }

    @Autowired
    public CartController(CategoryDataAccess categoryDataAccess, ProductDataAccess productDataAccess){
        super(categoryDataAccess);

        this.productDataAccess = productDataAccess;
    }

    @RequestMapping(method = RequestMethod.GET)
    public String getCart(Model model,
                          @ModelAttribute(value = Constants.CURRENT_CART) HashMap<Integer, OrderLine> cart) {
        model.addAttribute("categories", super.getAllCategories());
        model.addAttribute("title", "Cart page");
        model.addAttribute("orderLine", new OrderLine());

        return "integrated:cart";
    }

    @RequestMapping(method = RequestMethod.POST, value = "/add/{id}")
    public String addToCart(@ModelAttribute(value = Constants.CURRENT_CART) HashMap<Integer, OrderLine> cart,
                            @PathVariable(value = "id") Integer id,
                            @Valid @ModelAttribute(value = "orderLine") OrderLine orderLine,
                            final BindingResult errors
    ) {
        if (!errors.hasErrors()) {
            if (cart.containsKey(id)) {
                cart.get(id).setQuantity(cart.get(id).getQuantity() + orderLine.getQuantity());
            } else {
                Product product = productDataAccess.getProductById(id);

                orderLine.setProduct(product);
                cart.put(id, orderLine);
            }

            return "redirect:/cart";
        }
        return "integrated:/details/" + id;
    }

    @RequestMapping(method = RequestMethod.POST, value = "/update/{id}")
    public String updateCart(@ModelAttribute(value = Constants.CURRENT_CART) HashMap<Integer, OrderLine> cart,
                            @PathVariable(value = "id") Integer id,
                            @Valid @ModelAttribute(value = "orderLine") OrderLine orderLine,
                            final BindingResult errors
    ) {
        if (!errors.hasErrors()) {
            if (orderLine.getQuantity() > 0)
                cart.get(id).setQuantity(orderLine.getQuantity());
            else
                cart.remove(id);
            return "redirect:/cart";
        }
        return "integrated:/details/" + id;
    }
}
