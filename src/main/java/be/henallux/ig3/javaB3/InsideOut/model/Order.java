package be.henallux.ig3.javaB3.InsideOut.model;

import java.util.GregorianCalendar;
import java.util.List;

public class Order {
    private Integer id;
    private List<OrderLine> orderLines;
    private GregorianCalendar date;
    private User customer;

    public Order() {}

    public Order(List<OrderLine> orderLines, GregorianCalendar date, User customer) {
        this.orderLines = orderLines;
        this.date = date;
        this.customer = customer;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public List<OrderLine> getOrderLines() {
        return orderLines;
    }

    public void setOrderLines(List<OrderLine> orderLines) {
        this.orderLines = orderLines;
    }

    public GregorianCalendar getDate() {
        return date;
    }

    public void setDate(GregorianCalendar date) {
        this.date = date;
    }

    public User getCustomer() {
        return customer;
    }

    public void setCustomer(User customer) {
        this.customer = customer;
    }
}
