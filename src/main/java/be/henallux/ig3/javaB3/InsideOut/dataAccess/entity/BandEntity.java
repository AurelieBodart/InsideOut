package be.henallux.ig3.javaB3.InsideOut.dataAccess.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;

@Entity(name = "band")
public class BandEntity {
    @Id
    @Column(name = "id")
    private Integer id;

    @Column(name = "name")
    private String name;

    @Column(name = "history")
    private String history;

    public BandEntity(Integer id, String name, String history) {
        this.id = id;
        this.name = name;
        this.history = history;
    }

    public BandEntity() {
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

    public String getHistory() {
        return history;
    }

    public void setHistory(String history) {
        this.history = history;
    }

    @Override
    public String toString() {
        return "BandEntity{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", history='" + history + '\'' +
                '}';
    }
}
