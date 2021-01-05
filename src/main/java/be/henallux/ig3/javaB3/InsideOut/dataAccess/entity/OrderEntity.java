package be.henallux.ig3.javaB3.InsideOut.dataAccess.entity;

import javax.persistence.*;
import java.util.Date;
import java.util.List;

@Entity(name = "`order`")
public class OrderEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Integer id;

    @Column(name = "`date`")
    private Date date;

    @OneToMany(mappedBy = "orderEntity")
    private List<OrderLineEntity> orderLineEntities;

    @JoinColumn(name = "customer_id", referencedColumnName = "id")
    @ManyToOne
    private UserEntity customer;

    public OrderEntity() {}

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public List<OrderLineEntity> getOrderLineEntities() {
        return orderLineEntities;
    }

    public void setOrderLineEntities(List<OrderLineEntity> orderLineEntities) {
        this.orderLineEntities = orderLineEntities;
    }

    public UserEntity getCustomer() {
        return customer;
    }

    public void setCustomer(UserEntity customer) {
        this.customer = customer;
    }
}
