package be.henallux.ig3.javaB3.InsideOut.model;

public class TranslationCategory {
    private Integer id;
    private String languageRegionCode;
    private String label;

    public TranslationCategory(Integer id, String languageRegionCode, String label) {
        this.id = id;
        this.languageRegionCode = languageRegionCode;
        this.label = label;
    }

    public TranslationCategory() {
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
    public boolean equals(Object o) {
        return o instanceof TranslationCategory && ((TranslationCategory) o).getId().equals(id) && ((TranslationCategory) o).getLabel().equals(label) && ((TranslationCategory) o).getLanguageRegionCode().equals(languageRegionCode);
    }

    @Override
    public int hashCode() {
        return 0;
    }

    @Override
    public String toString() {
        return "Category{" +
                "id=" + id +
                ", languageRegionCode='" + languageRegionCode + '\'' +
                ", label='" + label + '\'' +
                '}';
    }
}
