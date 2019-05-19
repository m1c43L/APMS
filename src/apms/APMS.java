/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package apms;

import java.util.Vector;

/**
 *
 * @author Michael
 */
public class APMS {
    
    private static String user ="";
    private static String databaseHost = "";

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        // TODO code application logic here
    }
    
    
    public static void reset(){
        user = "";
    }
    
    public static boolean hasUser(){
        return user.length() > 0;
    }
    
    public static String getCurrentUser(){
        return user;
    }
    
    
    
    public static boolean verifyUser(String user){
        Vector <String> data =  DBhandler.getAll("Employee", "Name");
        boolean isValidUser = data.contains(user);
        if(isValidUser)  APMS.user = user;
        return isValidUser;
    }
    
    public static void setDBHost(String dbHost){
        databaseHost = dbHost;
    }
    
    public static String getDBHost(){
        return databaseHost;
    }
    
}
