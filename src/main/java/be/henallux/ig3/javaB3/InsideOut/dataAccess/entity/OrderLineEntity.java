package be.henallux.ig3.javaB3.InsideOut.dataAccess.entity;

import javax.persistence.*;

@Entity(name = "order_line")
public class OrderLineEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Integer id;

    @JoinColumn(name = "order_id", referencedColumnName = "id")
    @ManyToOne
    private OrderEntity orderEntity;

    @JoinColumn(name = "product_id", referencedColumnName = "id")
    @ManyToOne
    private ProductEntity productEntity;

    @Column(name = "price_shown")
    private Double priceShown;

    @Column(name = "quantity")
    private Integer quantity;

    public OrderLineEntity() {}

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public OrderEntity getOrderEntity() {
        return orderEntity;
    }

    public void setOrderEntity(OrderEntity orderEntity) {
        this.orderEntity = orderEntity;
    }

    public ProductEntity getProductEntity() {
        return productEntity;
    }

    public void setProductEntity(ProductEntity productEntity) {
        this.productEntity = productEntity;
    }

    public Double getPriceShown() {
        return priceShown;
    }

    public void setPriceShown(Double priceShown) {
        this.priceShown = priceShown;
    }

    public Integer getQuantity() {
        return quantity;
    }

    public void setQuantity(Integer quantity) {
        this.quantity = quantity;
    }
}
