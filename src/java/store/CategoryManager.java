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
public class CategoryManager
{
    private String cname;
    private int caid;

    public CategoryManager() {
    }

    /**
     * @return the caid
     */
    public int getCaid() {
        return caid;
    }

    /**
     * @param caid the caid to set
     */
    public void setCaid(int caid) {
        this.caid = caid;
    }

    /**
     * @return the cname
     */
    public String getCname() {
        return cname;
    }

    /**
     * @param cname the cname to set
     */
    public void setCname(String cname) {
        this.cname = cname;
    }
    
        // manipulate Table
    
    // insert record
    
    public void insertRecord() throws Exception
    {
        ShopManager.executeUpdate("INSERT INTO CategoryMaster VALUES( "+caid+" , '"+cname+"' )");
    }
    
    // update Record
    
    public void updateRecord() throws Exception
    {
        ShopManager.executeUpdate("UPDATE CategoryMaster set cname = '"+cname+"' WHERE caid="+caid+" ");
    }
    
    // delete Record
    
    public void deleteRecord() throws Exception
    {
        ShopManager.executeUpdate("DELETE FROM CategoryMaster WHERE caid="+caid+" ");
    }
    
     public CategoryManager getRecord() throws Exception
    {
        ResultSet rs =  ShopManager.executeQuery("SELECT * FROM CategoryMaster WHERE caid="+caid+"");
        CategoryManager row = new CategoryManager();
        if(rs!=null)
        {
            rs.next();
            row.setCaid(rs.getInt(1));
            row.setCname(rs.getString(2));
            return row;
        }
        return row;
    }
     
   // get All Record  
     
   public static List<CategoryManager> getRecords(String qry) throws Exception
   {
        List<CategoryManager> list = new ArrayList<>();
        ResultSet rs = ShopManager.executeQuery(qry);
        if(rs!=null)
        {
            while(rs.next())
            {
                CategoryManager row = new CategoryManager();
                row.setCaid(rs.getInt(1));
                row.setCname(rs.getString(2));
                list.add(row);
            }
            return list;
        }
        return list;    
   }
   
   public static int getNewId() throws Exception
   {
       ResultSet rs = ShopManager.executeQuery("SELECT max(caid) FROM CategoryMaster");
       if(rs==null)
       {
           return 100;
       }
       rs.next();
       int n = rs.getInt(1);
       rs.close();
       return n+1;
   }
   
}
