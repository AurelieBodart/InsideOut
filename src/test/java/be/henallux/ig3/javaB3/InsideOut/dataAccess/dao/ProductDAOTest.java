package be.henallux.ig3.javaB3.InsideOut.dataAccess.dao;

import be.henallux.ig3.javaB3.InsideOut.dataAccess.entity.BandEntity;
import be.henallux.ig3.javaB3.InsideOut.dataAccess.entity.CategoryEntity;
import be.henallux.ig3.javaB3.InsideOut.dataAccess.entity.ProductEntity;
import be.henallux.ig3.javaB3.InsideOut.dataAccess.repository.ProductRepository;
import be.henallux.ig3.javaB3.InsideOut.dataAccess.util.ProviderConverter;
import be.henallux.ig3.javaB3.InsideOut.model.Band;
import be.henallux.ig3.javaB3.InsideOut.model.Category;
import be.henallux.ig3.javaB3.InsideOut.model.Product;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.Mock;
import org.mockito.junit.MockitoJUnitRunner;
import org.springframework.boot.test.context.SpringBootTest;

import static org.assertj.core.api.Assertions.assertThat;
import static org.mockito.Mockito.when;

@RunWith(MockitoJUnitRunner.class)
@SpringBootTest
public class ProductDAOTest {
    private ProductDAO productDataAccess;

    @Mock
    private ProductRepository productRepository;

    @Before
    public void setUp() {
        productDataAccess = new ProductDAO(productRepository, new ProviderConverter());
    }

    @Test
    public void getProductById() {
        ProductEntity productEntity = new ProductEntity(1, "T-shirt manches courtes", 24.99, "m", "L", "Noir",
                "Shogun est le quatrième album studio de Trivium. Pour tous les fans de heavy metal, ce t-shirt « Shogun » est parfait pour regrouper vos souvenirs de cet album dans un vêtement de votre garde-robe, et il peut être commandé chez EMP. L'avant de ce haut noir affiche une reproduction fidèle de la couverture de l'album.","T-Shirts/Trivium_1.jpg",
                new BandEntity(5, "Trivium", "Trivium est un groupe de heavy metal américain, originaire d'Orlando, Floride. Formé en 2000, le groupe est passé du metalcore avec ses deux premiers albums (Ember to Inferno, Ascendancy), au thrash metal (The Crusade), jusqu'au compromis entre les deux (Shogun) ; cependant, l'appartenance au style metalcore est niée et désapprouvée par le groupe. En 2013, le groupe compte plus de 6 millions d'albums vendus à travers le monde. En 2020, le groupe compte au total neuf albums studio."), new CategoryEntity(5));

        when(productRepository.findProductEntityById(1)).thenReturn(productEntity);

        Product product = new Product(1, "T-shirt manches courtes", 24.99, "m", "L", "Noir",
                "Shogun est le quatrième album studio de Trivium. Pour tous les fans de heavy metal, ce t-shirt « Shogun » est parfait pour regrouper vos souvenirs de cet album dans un vêtement de votre garde-robe, et il peut être commandé chez EMP. L'avant de ce haut noir affiche une reproduction fidèle de la couverture de l'album.","T-Shirts/Trivium_1.jpg",
                new Band(5, "Trivium", "Trivium est un groupe de heavy metal américain, originaire d'Orlando, Floride. Formé en 2000, le groupe est passé du metalcore avec ses deux premiers albums (Ember to Inferno, Ascendancy), au thrash metal (The Crusade), jusqu'au compromis entre les deux (Shogun) ; cependant, l'appartenance au style metalcore est niée et désapprouvée par le groupe. En 2013, le groupe compte plus de 6 millions d'albums vendus à travers le monde. En 2020, le groupe compte au total neuf albums studio."), new Category(5)
        );
        assertThat(productDataAccess.getProductById(1)).isEqualTo(product);
    }
}