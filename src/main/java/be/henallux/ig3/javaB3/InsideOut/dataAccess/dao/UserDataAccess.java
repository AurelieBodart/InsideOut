package be.henallux.ig3.javaB3.InsideOut.dataAccess.dao;

import be.henallux.ig3.javaB3.InsideOut.model.User;

public interface UserDataAccess {
    User findByUsername(String username);
    User save(User user);
}
