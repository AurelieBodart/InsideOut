package be.henallux.ig3.javaB3.InsideOut.service;

import be.henallux.ig3.javaB3.InsideOut.dataAccess.dao.UserDataAccess;
import be.henallux.ig3.javaB3.InsideOut.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

@Service
public class UserDetailsServiceImplementation implements UserDetailsService {
    private UserDataAccess userDataAccess;

    @Autowired
    public UserDetailsServiceImplementation(UserDataAccess userDataAccess){
        this.userDataAccess = userDataAccess;
    }

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        User user = userDataAccess.findByUsername(username);
        if(user != null)
            return user;
        throw new UsernameNotFoundException("User not found");
    }
}
