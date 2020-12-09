package be.henallux.ig3.javaB3.InsideOut.dataAccess.dao;

import be.henallux.ig3.javaB3.InsideOut.dataAccess.entity.TranslationCategoryEntity;
import be.henallux.ig3.javaB3.InsideOut.dataAccess.repository.CategoryRepository;
import be.henallux.ig3.javaB3.InsideOut.dataAccess.util.ProviderConverter;
import be.henallux.ig3.javaB3.InsideOut.model.TranslationCategory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class CategoryDAO implements CategoryDataAccess{
    private CategoryRepository categoryRepository;
    private ProviderConverter providerConverter;

    @Autowired
    public CategoryDAO(CategoryRepository categoryRepository, ProviderConverter providerConverter) {
        this.categoryRepository = categoryRepository;
        this.providerConverter = providerConverter;
    }

    public ArrayList<TranslationCategory> getAllCategories(){
        List<TranslationCategoryEntity> categoryEntities = categoryRepository.findCategoryEntitiesByLanguageRegionCode(LocaleContextHolder.getLocale().getLanguage());

        ArrayList<TranslationCategory> categories = new ArrayList<>();
        for(TranslationCategoryEntity translationCategoryEntity : categoryEntities)
            categories.add(providerConverter.categoryEntityToCategoryModel(translationCategoryEntity));

        return categories;
    }
}
