package be.henallux.ig3.javaB3.InsideOut.dataAccess.repository;

import be.henallux.ig3.javaB3.InsideOut.dataAccess.entity.OrderEntity;
import be.henallux.ig3.javaB3.InsideOut.model.Order;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface OrderRepository extends JpaRepository<OrderEntity, Order> {

}
