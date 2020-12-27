package be.henallux.ig3.javaB3.InsideOut.dataAccess.entity;

import javax.persistence.*;

@Entity(name = "product")
public class ProductEntity {
    @Id
    @Column(name = "id")
    private Integer id;

    @Column(name = "name")
    private String name;

    @Column(name = "price")
    private Double price;

    @Column(name = "targeted_gender")
    private String targetedGender;

    @Column(name = "size")
    private String size;

    @Column(name = "color")
    private String color;

    @Column(name = "description")
    private String description;

    @Column(name = "image")
    private String image;

    @JoinColumn(name = "band_id", referencedColumnName = "id")
    @ManyToOne
    private BandEntity bandEntity;

    @JoinColumn(name = "category_id", referencedColumnName = "id")
    @ManyToOne
    private CategoryEntity categoryEntity;

    public ProductEntity() {
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

    public BandEntity getBandEntity() {
        return bandEntity;
    }

    public void setBandEntity(BandEntity bandEntity) {
        this.bandEntity = bandEntity;
    }

    public CategoryEntity getCategoryEntity() {
        return categoryEntity;
    }

    public void setCategoryEntity(CategoryEntity categoryEntity) {
        this.categoryEntity = categoryEntity;
    }

    @Override
    public String toString() {
        return "ProductEntity{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", price=" + price +
                ", targetedGender='" + targetedGender + '\'' +
                ", size='" + size + '\'' +
                ", color='" + color + '\'' +
                ", description='" + description + '\'' +
                ", image='" + image + '\'' +
                ", bandEntity=" + bandEntity +
                ", categoryEntity=" + categoryEntity +
                '}';
    }
}
