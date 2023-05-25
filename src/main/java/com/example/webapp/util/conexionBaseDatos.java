package com.example.webapp.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class conexionBaseDatos {
    private static final String url = "jdbc:mysql://localhost:3306/bdtortillas";
    private static final String username = "root";
    private static final String password = "1357924680mM!";

    public static Connection getInstance(){

        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection connection = DriverManager.getConnection(url, username, password);
            return connection;
        } catch (SQLException | ClassNotFoundException ex) {
                System.out.println("An error occurred while connecting MySQL databse");
                ex.printStackTrace();
                return null;
        }
    }
}
