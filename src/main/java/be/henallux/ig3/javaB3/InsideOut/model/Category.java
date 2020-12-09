package be.henallux.ig3.javaB3.InsideOut.model;

public class Category {
    private Integer id;

    public Category() {
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    @Override
    public String toString() {
        return "category{" +
                "id=" + id +
                '}';
    }
}
