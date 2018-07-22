/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package store;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Dell
 */
public class AdminManager 
{
    private String adminid,pwd;
    
    public AdminManager(){}

    /**
     * @return the adminid
     */
    public String getAdminid() {
        return adminid;
    }

    /**
     * @param adminid the adminid to set
     */
    public void setAdminid(String adminid) {
        this.adminid = adminid;
    }

    /**
     * @return the pwd
     */
    public String getPwd() {
        return pwd;
    }

    /**
     * @param pwd the pwd to set
     */
    public void setPwd(String pwd) {
        this.pwd = pwd;
    }
    
        // manipulate Table
    
    // insert record
    
    public void insertRecord() throws Exception
    {
        ShopManager.executeUpdate("INSERT INTO AdminMaster Values( '"+adminid+"' , '"+pwd+"' )");
    }
    
    // update Record
    
    public void updateRecord() throws Exception
    {
        ShopManager.executeUpdate("UPDATE AdminMaster set pwd = '"+pwd+"' WHERE adminid='"+adminid+"' ");
    }
    
    // delete Record
    
    public void deleteRecord() throws Exception
    {
        ShopManager.executeUpdate("DELETE FROM AdminMaster WHERE adminid='"+adminid+"'");
    }
    
     public AdminManager getRecord() throws Exception
        {
        ResultSet rs =  ShopManager.executeQuery("SELECT * FROM AdminMaster WHERE adminid='"+adminid+"'");
        AdminManager row = new AdminManager();
        if(rs!=null)
        {
            rs.next();
            row.setAdminid(rs.getString(1));
            row.setPwd(rs.getString(2));
            return row;
        }
        return row;
    }
     
   // get All Record  
     
   public static List<AdminManager> getRecords(String qry) throws Exception
   {
        List<AdminManager> list = new ArrayList<>();
        ResultSet rs = ShopManager.executeQuery(qry);
        if(rs!=null)
        {
            while(rs.next())
            {
                AdminManager row = new AdminManager();
                row.setAdminid(rs.getString(1));
                row.setPwd(rs.getString(2));
                list.add(row);
            }
            return list;
        }
        return list;    
   }
    
   // validate admin
   
  public static boolean validate(String id,String pass) throws Exception
    {
        List<AdminManager> list = AdminManager.getRecords("SELECT * FROM AdminMaster");
        for(int i=0;i<list.size();i++)
        {
            if( list.get(i).getAdminid().equals(id) && list.get(i).getPwd().equals(pass) )
            {
                return true;
            }
        }
        return false;
    } 
   
}
