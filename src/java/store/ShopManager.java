/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package store;
import java.sql.*;
/**
 *
 * @author Dell
 */
public class ShopManager 
{
    public static ResultSet executeQuery(String qry) throws Exception
    {
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/shopdb","root","root");
        Statement st = con.createStatement();
        ResultSet rs = st.executeQuery(qry);
        return rs;        
    }
    
    public static int executeUpdate(String qry) throws Exception
    {
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/shopdb","root","root");
        Statement st = con.createStatement();
        int rs = st.executeUpdate(qry);
        return rs;        
    }
}
