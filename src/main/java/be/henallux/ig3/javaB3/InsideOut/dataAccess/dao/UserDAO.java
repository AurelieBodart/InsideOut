package be.henallux.ig3.javaB3.InsideOut.dataAccess.dao;

import be.henallux.ig3.javaB3.InsideOut.dataAccess.entity.UserEntity;
import be.henallux.ig3.javaB3.InsideOut.dataAccess.repository.UserRepository;
import be.henallux.ig3.javaB3.InsideOut.dataAccess.util.ProviderConverter;
import be.henallux.ig3.javaB3.InsideOut.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;

@Service
public class UserDAO implements UserDataAccess{
    private UserRepository userRepository;
    private ProviderConverter providerConverter;

    @Autowired
    public UserDAO(UserRepository userRepository, ProviderConverter providerConverter) {
        this.userRepository = userRepository;
        this.providerConverter = providerConverter;
    }

    public User findByUsername(String username){
        UserEntity userEntity = userRepository.findByUsername(username);
        return providerConverter.userEntityToUserModel(userEntity);
    }

    @Transactional
    public User save(User user){
        UserEntity userEntity = providerConverter.userModelToUserEntity(user);
        userEntity = userRepository.save(userEntity);
        return providerConverter.userEntityToUserModel(userEntity);
    }
}
