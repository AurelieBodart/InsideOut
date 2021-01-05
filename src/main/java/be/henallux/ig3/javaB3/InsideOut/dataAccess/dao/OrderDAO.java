package be.henallux.ig3.javaB3.InsideOut.dataAccess.dao;

import be.henallux.ig3.javaB3.InsideOut.dataAccess.entity.OrderEntity;
import be.henallux.ig3.javaB3.InsideOut.dataAccess.repository.OrderLineRepository;
import be.henallux.ig3.javaB3.InsideOut.dataAccess.repository.OrderRepository;
import be.henallux.ig3.javaB3.InsideOut.dataAccess.util.ProviderConverter;
import be.henallux.ig3.javaB3.InsideOut.model.Order;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;

@Service
public class OrderDAO implements OrderDataAccess {
    private OrderRepository orderRepository;
    private OrderLineRepository orderLineRepository;
    private ProviderConverter providerConverter;

    @Autowired
    public OrderDAO(OrderRepository orderRepository, OrderLineRepository orderLineRepository, ProviderConverter providerConverter) {
        this.orderRepository = orderRepository;
        this.orderLineRepository = orderLineRepository;
        this.providerConverter = providerConverter;
    }

    @Transactional
    @Override
    public Order save(Order order) {
        OrderEntity orderEntity = providerConverter.orderModelToOrderEntity(order);

        orderEntity = orderRepository.save(orderEntity);
        orderLineRepository.saveAll(orderEntity.getOrderLineEntities());

        return providerConverter.orderEntityToOrderModel(orderEntity);
    }
}
