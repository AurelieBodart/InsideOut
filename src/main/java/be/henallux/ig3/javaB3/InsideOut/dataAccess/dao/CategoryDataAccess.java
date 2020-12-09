package be.henallux.ig3.javaB3.InsideOut.dataAccess.dao;

import be.henallux.ig3.javaB3.InsideOut.model.TranslationCategory;

import java.util.ArrayList;

public interface CategoryDataAccess {
    ArrayList<TranslationCategory> getAllCategories();
}
