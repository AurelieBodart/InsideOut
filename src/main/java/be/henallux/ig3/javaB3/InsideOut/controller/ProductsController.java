package be.henallux.ig3.javaB3.InsideOut.controller;

import be.henallux.ig3.javaB3.InsideOut.dataAccess.dao.CategoryDataAccess;
import be.henallux.ig3.javaB3.InsideOut.dataAccess.dao.ProductDataAccess;
import be.henallux.ig3.javaB3.InsideOut.model.Category;
import be.henallux.ig3.javaB3.InsideOut.model.TranslationCategory;
import be.henallux.ig3.javaB3.InsideOut.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.ArrayList;
import java.util.stream.Collectors;

@Controller
@RequestMapping(value = "/products")
public class ProductsController extends SuperController{
    private ProductDataAccess productDataAccess;

    @Autowired
    public ProductsController(CategoryDataAccess categoryDataAccess, ProductDataAccess productDataAccess) {
        super(categoryDataAccess);
        this.productDataAccess = productDataAccess;
    }

    @RequestMapping (value = "/{category}", method = RequestMethod.GET)
    public String getProducts (@PathVariable("category") Integer categoryId, Model model) {

        ArrayList<TranslationCategory> categories = super.getAllCategories();

        String categoryChosen = categories
                .stream()
                .filter(category -> category.getId().equals(categoryId))
                .map(TranslationCategory::getLabel)
                .collect(Collectors.toCollection(ArrayList::new))
                .get(0);

        model.addAttribute("categories", categories);
        model.addAttribute("categoryChosen", categoryChosen);
        model.addAttribute("products", productDataAccess.getAllProductsByCategory(categoryId));
        model.addAttribute("title", "Products page");

        return "integrated:products";
    }
}
