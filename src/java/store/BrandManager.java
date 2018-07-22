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
public class BrandManager
{
    private String bname;
    private int bid;

        public BrandManager() {
        }

        /**
         * @return the bid
         */
        public int getBid() {
            return bid;
        }

        /**
         * @param bid the bid to set
         */
        public void setBid(int bid) {
            this.bid = bid;
        }

        /**
         * @return the bname
         */
        public String getBname() {
            return bname;
        }

        /**
         * @param bname the bname to set
         */
        public void setBname(String bname) {
            this.bname = bname;
        }
    
    
        // manipulate Table
    
    // insert record
    
    public void insertRecord() throws Exception
    {
        ShopManager.executeUpdate("INSERT INTO BrandMaster VALUES( "+bid+" , '"+bname+"' )");
    }
    
    // update Record
    
    public void updateRecord() throws Exception
    {
        ShopManager.executeUpdate("UPDATE BrandMaster set bname = '"+bname+"' WHERE bid="+bid+" ");
    }
    
    // delete Record
    
    public void deleteRecord() throws Exception
    {
        ShopManager.executeUpdate("DELETE FROM BrandMaster WHERE bid="+bid+"");
    }
    
     public BrandManager getRecord() throws Exception
    {
        ResultSet rs =  ShopManager.executeQuery("SELECT * FROM BrandMaster WHERE bid="+bid+"");
        BrandManager row = new BrandManager();
        if(rs!=null)
        {
            rs.next();
            row.setBid(rs.getInt(1));
            row.setBname(rs.getString(2));
            return row;
        }
        return row;
    }
     
   // get All Record  
     
   public static List<BrandManager> getRecords(String qry) throws Exception
   {
        List<BrandManager> list = new ArrayList<>();
        ResultSet rs = ShopManager.executeQuery(qry);
        if(rs!=null)
        {
            while(rs.next())
            {
                BrandManager row = new BrandManager();
                row.setBid(rs.getInt(1));
                row.setBname(rs.getString(2));
                list.add(row);
            }
            return list;
        }
        return list;    
   }
    
   
   public static int getNewId() throws Exception
   {
       ResultSet rs = ShopManager.executeQuery("SELECT max(bid) FROM BrandMaster");
       if( rs == null )
       {
           return 100;
       }
       
       rs.next();
       int n = rs.getInt(1);
       rs.close();
       return n+1;
   }
    
}
