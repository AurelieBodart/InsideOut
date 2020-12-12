package be.henallux.ig3.javaB3.InsideOut.controller;

import be.henallux.ig3.javaB3.InsideOut.dataAccess.dao.CategoryDataAccess;
import be.henallux.ig3.javaB3.InsideOut.dataAccess.dao.ProductDataAccess;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
@RequestMapping(value = "/details")
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

        return "integrated:productDetails";
    }
}
