package be.henallux.ig3.javaB3.InsideOut.dataAccess.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;

@Entity(name = "Category")
public class CategoryEntity {
    @Id
    @Column(name = "id")
    private Integer id;

    public CategoryEntity() {
    }

    public CategoryEntity(Integer id) {
        this.id = id;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    @Override
    public String toString() {
        return "CategoryEntity{" +
                "id=" + id +
                '}';
    }
}
