package be.henallux.ig3.javaB3.InsideOut.controller;

import be.henallux.ig3.javaB3.InsideOut.dataAccess.dao.CategoryDataAccess;
import be.henallux.ig3.javaB3.InsideOut.dataAccess.dao.ProductDataAccess;
import be.henallux.ig3.javaB3.InsideOut.model.OrderLine;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import java.util.HashMap;


@Controller
@RequestMapping(value = "/details")
@SessionAttributes(Constants.CURRENT_CART)
public class ProductDetailsController extends SuperController{

    private ProductDataAccess productDataAccess;

    @Autowired
    public ProductDetailsController(CategoryDataAccess categoryDataAccess, ProductDataAccess productDataAccess) {
        super(categoryDataAccess);
        this.productDataAccess = productDataAccess;
    }

    @RequestMapping (value = "/{productId}", method = RequestMethod.GET)
    public String getProduct (@PathVariable("productId") Integer productId, Model model) {

        model.addAttribute("categories", super.getAllCategories());
        model.addAttribute("product", productDataAccess.getProductById(productId));
        model.addAttribute("title", "Product details page");
        model.addAttribute("orderLine", new OrderLine());
        if (!model.containsAttribute("cart"))
            model.addAttribute("cart", new HashMap<Integer, OrderLine>());

        return "integrated:productDetails";
    }
}
