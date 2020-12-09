package be.henallux.ig3.javaB3.InsideOut.dataAccess.dao;

import be.henallux.ig3.javaB3.InsideOut.model.Product;

import java.util.ArrayList;

public interface ProductDataAccess {
    ArrayList<Product> getAllProductsByCategory(Integer categoryId);
    Product getProductById(Integer productId);
}
