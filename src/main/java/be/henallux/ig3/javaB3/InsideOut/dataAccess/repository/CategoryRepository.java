package be.henallux.ig3.javaB3.InsideOut.dataAccess.repository;

import be.henallux.ig3.javaB3.InsideOut.dataAccess.entity.TranslationCategoryEntity;
import be.henallux.ig3.javaB3.InsideOut.dataAccess.entity.TranslationCategoryId;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface CategoryRepository extends JpaRepository <TranslationCategoryEntity, TranslationCategoryId> {
    List<TranslationCategoryEntity> findCategoryEntitiesByLanguageRegionCode(String locale);
}
