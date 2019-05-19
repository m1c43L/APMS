/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package apms;

import java.sql.*;
import java.util.Vector;

/**
 * All Database transactions will be handled here.
 *
 * @author Michael
 */
public class DBhandler {
    
    public final static String JDBC = "com.mysql.jdbc.Driver";
    private static Connection connection;
    private static Statement statement;
    private static boolean isConnected = false;
    
    
    
    public DBhandler(String url, String username ,String password) throws SQLException, ClassNotFoundException{
        Class.forName(JDBC);  
        connection = DriverManager.getConnection(url, username, password);
         statement = connection.createStatement();
         isConnected = true;
    }    
    
    
    public static void initialize(String url, String username ,String password)throws SQLException, ClassNotFoundException {
        Class.forName(JDBC);  
        connection = DriverManager.getConnection(url, username, password);
        statement = connection.createStatement();
        isConnected = true;
    }
    
    public static ResultSet executeQuery(String query) throws SQLException{
        return statement.executeQuery(query);
    }
    
    
    public static Vector<String> getAll(String tableName, String columnName){
        Vector <String> data = new Vector();
        try{
            ResultSet set = executeQuery("Select * From " + tableName);
           
            while(set.next()){
                data.add(set.getString(columnName));
            }
            
        }catch(SQLException e){
           return null; 
        }
        return data;
    }
    
    
    public static void closeConnection() throws SQLException{
        connection.close();
        isConnected = false;
    }
    
    public static boolean connected(){
        return isConnected;
    }
    
    public static String getStatusLog(){
        return isConnected ? "Connected to " + APMS.getDBHost() : "Not Connected";
    }
    
    
}
