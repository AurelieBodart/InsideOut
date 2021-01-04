package be.henallux.ig3.javaB3.InsideOut.dataAccess.repository;

import be.henallux.ig3.javaB3.InsideOut.dataAccess.entity.ProductEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ProductRepository extends JpaRepository<ProductEntity, Integer> {
    List<ProductEntity> findProductEntitiesByCategoryEntityId(Integer categoryId);

    ProductEntity findProductEntityById(Integer productId);
}
