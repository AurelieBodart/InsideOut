package be.henallux.ig3.javaB3.InsideOut.dataAccess.util;

import be.henallux.ig3.javaB3.InsideOut.dataAccess.entity.*;
import be.henallux.ig3.javaB3.InsideOut.model.*;
import org.dozer.DozerBeanMapper;
import org.dozer.Mapper;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.stream.Collectors;

@Component
public class ProviderConverter {
    private Mapper mapper = new DozerBeanMapper();

    public User userEntityToUserModel(UserEntity userEntity){
        User user = mapper.map(userEntity, User.class);

        user.setAccountNonExpired(userEntity.getAccountNonExpired());
        user.setAccountNonLocked(userEntity.getAccountNonLocked());
        user.setCredentialsNonExpired(userEntity.getCredentialsNonExpired());
        user.setEnabled(userEntity.getEnabled());
        user.setAuthorities(userEntity.getAuthorities());
        return user;
    }

    public UserEntity userModelToUserEntity(User user) {
        UserEntity userEntity = mapper.map(user, UserEntity.class);
        userEntity.setBirthdate(user.getBirthdate());
        return userEntity;
    }

    public TranslationCategory categoryEntityToCategoryModel(TranslationCategoryEntity translationCategoryEntity) {
        return mapper.map(translationCategoryEntity, TranslationCategory.class);
    }

    public Product productEntityToProductModel(ProductEntity productEntity) {
        return mapper.map(productEntity, Product.class);
    }

    public Band bandEntityToBandModel(BandEntity bandEntity) {
        return mapper.map(bandEntity, Band.class);
    }

    public Category categoryEntityToCategoryModel(CategoryEntity categoryEntity) {
        return mapper.map(categoryEntity, Category.class);
    }

    public OrderEntity orderModelToOrderEntity(Order order) {
        OrderEntity orderEntity = mapper.map(order, OrderEntity.class);

        orderEntity.setOrderLineEntities(order.getOrderLines()
                .stream()
                .map(orderLine -> {
                    OrderLineEntity orderLineEntity = new OrderLineEntity();
                    ProductEntity productEntity = mapper.map(orderLine.getProduct(), ProductEntity.class);

                    orderLineEntity.setOrderEntity(orderEntity);
                    orderLineEntity.setProductEntity(productEntity);
                    orderLineEntity.setPriceShown(productEntity.getPrice());
                    orderLineEntity.setQuantity(orderLine.getQuantity());

                    return orderLineEntity;
                })
                .collect(Collectors.toCollection(ArrayList::new)));

        return orderEntity;
    }

    public Order orderEntityToOrderModel(OrderEntity orderEntity) {
        return mapper.map(orderEntity, Order.class);
    }
}
