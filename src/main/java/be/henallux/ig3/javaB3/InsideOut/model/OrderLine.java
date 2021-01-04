package be.henallux.ig3.javaB3.InsideOut.model;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.PositiveOrZero;

public class OrderLine {
    private Product product;
    @NotNull
    @PositiveOrZero
    private int quantity;

    public OrderLine() {}

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }
}
