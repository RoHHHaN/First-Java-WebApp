package com.website.helper;

import java.sql.*;

public class ConnectionProvider {

    private static Connection con;

    public static Connection getConnection() {
        try {
            //Driver Class Load
            if (con == null) {
                Class.forName("org.postgresql.Driver");
                con = DriverManager.getConnection("jdbc:postgresql://db.aktdemplyleaulzisvpt.supabase.co:5432/postgres", "postgres", "a9933414729");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return con;
    }

}
