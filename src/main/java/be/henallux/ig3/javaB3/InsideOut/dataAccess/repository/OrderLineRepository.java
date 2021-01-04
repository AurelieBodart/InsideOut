package be.henallux.ig3.javaB3.InsideOut.dataAccess.repository;

import be.henallux.ig3.javaB3.InsideOut.dataAccess.entity.OrderLineEntity;
import be.henallux.ig3.javaB3.InsideOut.model.OrderLine;
import org.springframework.data.jpa.repository.JpaRepository;

public interface OrderLineRepository extends JpaRepository<OrderLineEntity, OrderLine> {
}
