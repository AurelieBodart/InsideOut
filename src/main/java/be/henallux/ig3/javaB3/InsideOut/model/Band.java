package be.henallux.ig3.javaB3.InsideOut.model;

public class Band {
    private Integer id;
    private String name;
    private String history;

    public Band(Integer id, String name, String history) {
        this.id = id;
        this.name = name;
        this.history = history;
    }

    public Band() {
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
    public boolean equals(Object o) {
        return o instanceof Band && ((Band) o).getId().equals(getId()) &&
                ((Band) o).getName().equals(getName()) &&
                ((Band) o).getHistory().equals(getHistory());
    }

    @Override
    public String toString() {
        return "Band{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", history='" + history + '\'' +
                '}';
    }
}
