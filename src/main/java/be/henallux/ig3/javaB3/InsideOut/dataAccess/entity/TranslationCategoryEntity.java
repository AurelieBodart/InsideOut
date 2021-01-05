package be.henallux.ig3.javaB3.InsideOut.dataAccess.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.IdClass;

@Entity(name = "translation")
@IdClass(TranslationCategoryId.class)
public class TranslationCategoryEntity {
    @Id
    @Column(name = "category_id")
    private Integer id;
    @Id
    @Column(name = "language_region_code")
    private String languageRegionCode;

    @Column(name = "label")
    private String label;

    public TranslationCategoryEntity(Integer id, String languageRegionCode, String label) {
        this.id = id;
        this.languageRegionCode = languageRegionCode;
        this.label = label;
    }

    public TranslationCategoryEntity() {
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getLanguageRegionCode() {
        return languageRegionCode;
    }

    public void setLanguageRegionCode(String languageRegionCode) {
        this.languageRegionCode = languageRegionCode;
    }

    public String getLabel() {
        return label;
    }

    public void setLabel(String label) {
        this.label = label;
    }

    @Override
    public String toString() {
        return "CategoryEntity{" +
                "id=" + id +
                ", languageRegionCode='" + languageRegionCode + '\'' +
                ", label='" + label + '\'' +
                '}';
    }
}
