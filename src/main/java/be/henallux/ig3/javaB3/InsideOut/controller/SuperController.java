package be.henallux.ig3.javaB3.InsideOut.controller;

import be.henallux.ig3.javaB3.InsideOut.dataAccess.dao.CategoryDataAccess;
import be.henallux.ig3.javaB3.InsideOut.model.TranslationCategory;

import java.util.ArrayList;

public class SuperController {
    private CategoryDataAccess categoryDataAccess;

    public SuperController(CategoryDataAccess categoryDataAccess) {
        this.categoryDataAccess = categoryDataAccess;
    }

    public ArrayList<TranslationCategory> getAllCategories() {
        return this.categoryDataAccess.getAllCategories();
    }
}
