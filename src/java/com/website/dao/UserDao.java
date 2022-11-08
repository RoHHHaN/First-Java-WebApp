package com.website.dao;

import com.website.entities.User;
import java.sql.*;

public class UserDao {

    private Connection con;

    public UserDao(Connection con) {
        this.con=con;
    }
    
//    Get Use by User-Email & User-Password
    
    public User getUserByEmainAndPassword(String email, String password){
        User user = null;
        
        try{
            String query="select * from users where email=? and pass=?";
            PreparedStatement st = con.prepareStatement(query);
            st.setString(1, email);
            st.setString(2, password);
            ResultSet set = st.executeQuery();
            
            if(set.next()){
                user=new User();
                user.setName(set.getString("name"));
                user.setEmail(set.getString("email"));
                user.setPassword( set.getString("pass"));
            }
            
        }catch(Exception e){
            System.out.println(e.getMessage());
        }
        
        return user;
    }
}
