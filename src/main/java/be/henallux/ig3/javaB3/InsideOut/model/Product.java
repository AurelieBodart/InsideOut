package be.henallux.ig3.javaB3.InsideOut.model;

import javax.validation.constraints.Positive;

public class Product {
    private Integer id;
    private String name;
    @Positive
    private Double price;
    private String targetedGender;
    private String size;
    private String color;
    private String description;
    private String image;
    private Band band;
    private Category category;

    public Product() {
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Double getPrice() {
        return price;
    }

    public void setPrice(Double price) {
        this.price = price;
    }

    public String getTargetedGender() {
        return targetedGender;
    }

    public void setTargetedGender(String targetedGender) {
        this.targetedGender = targetedGender;
    }

    public String getSize() {
        return size;
    }

    public void setSize(String size) {
        this.size = size;
    }

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public Band getBand() {
        return band;
    }

    public void setBand(Band band) {
        this.band = band;
    }

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }

    @Override
    public String toString() {
        return "Product{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", price=" + price +
                ", targetedGender='" + targetedGender + '\'' +
                ", size='" + size + '\'' +
                ", color='" + color + '\'' +
                ", description='" + description + '\'' +
                ", image='" + image + '\'' +
                '}';
    }
}
