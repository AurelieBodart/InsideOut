package be.henallux.ig3.javaB3.InsideOut.dataAccess.dao;

import be.henallux.ig3.javaB3.InsideOut.dataAccess.entity.ProductEntity;
import be.henallux.ig3.javaB3.InsideOut.dataAccess.repository.ProductRepository;
import be.henallux.ig3.javaB3.InsideOut.dataAccess.util.ProviderConverter;
import be.henallux.ig3.javaB3.InsideOut.model.Product;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class ProductDAO implements ProductDataAccess{
    private ProductRepository productRepository;
    private ProviderConverter providerConverter;

    @Autowired
    public ProductDAO(ProductRepository productRepository, ProviderConverter providerConverter) {
        this.productRepository = productRepository;
        this.providerConverter = providerConverter;
    }

    public ArrayList<Product> getAllProductsByCategory(Integer categoryId) {
        List<ProductEntity> productEntityList = productRepository.findProductEntitiesByCategoryEntityId(categoryId);

        ArrayList<Product> products = new ArrayList<>();

        for(ProductEntity productEntity : productEntityList)
            products.add(convertProduct(productEntity));

        return products;
    }

    public Product getProductById(Integer productId) {
        ProductEntity productEntity = productRepository.findProductEntityById(productId);

        return convertProduct(productEntity);
    }

    private Product convertProduct (ProductEntity productEntity) {
        Product product = providerConverter.productEntityToProductModel(productEntity);
        product.setBand(providerConverter.bandEntityToBandModel(productEntity.getBandEntity()));
        product.setCategory(providerConverter.categoryEntityToCategoryModel(productEntity.getCategoryEntity()));

        return product;
    }
}
