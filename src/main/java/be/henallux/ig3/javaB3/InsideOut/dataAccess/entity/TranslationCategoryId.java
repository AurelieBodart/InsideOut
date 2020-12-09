package be.henallux.ig3.javaB3.InsideOut.dataAccess.entity;

import java.io.Serializable;

public class TranslationCategoryId implements Serializable {

    private Integer id;
    private String languageRegionCode;

    public TranslationCategoryId() {
    }

    public TranslationCategoryId(Integer id, String languageRegionCode) {
        this.id = id;
        this.languageRegionCode = languageRegionCode;
    }
}
