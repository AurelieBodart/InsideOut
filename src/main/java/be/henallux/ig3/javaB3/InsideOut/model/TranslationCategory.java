package be.henallux.ig3.javaB3.InsideOut.model;

public class TranslationCategory {
    private Integer id;
    private String languageRegionCode;
    private String label;

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
    public String toString() {
        return "Category{" +
                "id=" + id +
                ", languageRegionCode='" + languageRegionCode + '\'' +
                ", label='" + label + '\'' +
                '}';
    }
}
