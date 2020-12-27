package be.henallux.ig3.javaB3.InsideOut.dataAccess.repository;

import be.henallux.ig3.javaB3.InsideOut.dataAccess.entity.UserEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface UserRepository extends JpaRepository<UserEntity, String> {
    UserEntity findByUsername(String username);
}
