package be.henallux.ig3.javaB3.InsideOut.dataAccess.dao;

import be.henallux.ig3.javaB3.InsideOut.dataAccess.entity.TranslationCategoryEntity;
import be.henallux.ig3.javaB3.InsideOut.dataAccess.repository.CategoryRepository;
import be.henallux.ig3.javaB3.InsideOut.dataAccess.util.ProviderConverter;
import be.henallux.ig3.javaB3.InsideOut.model.TranslationCategory;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.Mock;
import org.mockito.junit.MockitoJUnitRunner;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.ArrayList;

import static org.assertj.core.api.Assertions.assertThat;
import static org.mockito.Mockito.when;

@RunWith(MockitoJUnitRunner.class)
@SpringBootTest
public class CategoryDAOTest {
    private CategoryDAO categoryDAO;

    @Mock
    private CategoryRepository categoryRepository;

    @Before
    public void setUp() {
        categoryDAO = new CategoryDAO(categoryRepository, new ProviderConverter());
    }

    @Test
    public void getAllCategories() {
        ArrayList<TranslationCategoryEntity> categoryEntities = new ArrayList<>();
        categoryEntities.add(new TranslationCategoryEntity(1, "fr", "Accessories"));
        categoryEntities.add(new TranslationCategoryEntity(2, "fr", "Chaussures"));
        categoryEntities.add(new TranslationCategoryEntity(3, "fr", "Pulls"));
        categoryEntities.add(new TranslationCategoryEntity(4, "fr", "Albums"));
        categoryEntities.add(new TranslationCategoryEntity(5, "fr", "T-shirts"));
        when(categoryRepository.findCategoryEntitiesByLanguageRegionCode("fr")).thenReturn(categoryEntities);

        ArrayList<TranslationCategory> categories = new ArrayList<>();
        categories.add(new TranslationCategory(1, "fr", "Accessories"));
        categories.add(new TranslationCategory(2, "fr", "Chaussures"));
        categories.add(new TranslationCategory(3, "fr", "Pulls"));
        categories.add(new TranslationCategory(4, "fr", "Albums"));
        categories.add(new TranslationCategory(5, "fr", "T-shirts"));
        assertThat(categoryDAO.getAllCategories()).isEqualTo(categories);
    }
}