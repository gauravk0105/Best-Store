/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package store;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
/**
 *
 * @author Dell
 */
public class CustomerManager
{
    private String cid,pwd,cname,cstatus;
    private String ccontact;

    public CustomerManager()
    {
    }
    
    /**
     * @return the cid
     */
    public String getCid() {
        return cid;
    }

    /**
     * @param cid the cid to set
     */
    public void setCid(String cid) {
        this.cid = cid;
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

   
    /**
     * @return the cstatus
     */
    public String getCstatus() {
        return cstatus;
    }

    /**
     * @param cstatus the cstatus to set
     */
    public void setCstatus(String cstatus) {
        this.cstatus = cstatus;
    }

    /**
     * @return the ccontact
     */
    public String getCcontact() {
        return ccontact;
    }

    /**
     * @param ccontact the ccontact to set
     */
    public void setCcontact(String ccontact) {
        this.ccontact = ccontact;
    }

  
    // manipulate table
    
    
    // insert into Table
    
    public void insertRecord() throws Exception
    {
        ShopManager.executeUpdate("INSERT INTO CustomerMaster VALUES( '"+cid+"','"+pwd+"','"+cname+"','"+ccontact+"','"+cstatus+"')");
    }
    
    // update the record
    
    public void updateRecord() throws Exception
    {
        ShopManager.executeUpdate("UPDATE CustomerMaster set  pwd='"+pwd+"',cname='"+cname+"',ccontact='"+ccontact+"',cstatus='"+cstatus+"' WHERE cid='"+cid+"'");
    }
    
    // delete record from table
    
    public void deleteRecord() throws Exception
    {
        ShopManager.executeUpdate("DELETE FROM CustomerMaster WHERE cid='"+cid+"'");
    }
    
    // get record From table
    
    public CustomerManager getRecord() throws Exception
    {
        ResultSet rs =  ShopManager.executeQuery("SELECT * FROM CustomerMaster WHERE cid='"+cid+"'");
        CustomerManager row = new CustomerManager();
        if(rs!=null)
        {
            rs.next();
            row.setCid(rs.getString(1));
            row.setPwd(rs.getString(2));
            row.setCname(rs.getString(3));
            row.setCcontact(rs.getString(4));
            row.setCstatus(rs.getString(5));
            return row;
        }
        return row;
    }
    
    // get all Record From Table
    
    public static List<CustomerManager> getRecords(String qry) throws Exception 
    {
        List<CustomerManager> list = new ArrayList<>();
        ResultSet rs = ShopManager.executeQuery(qry);
        if(rs!=null)
        {
            while(rs.next())
            {
                CustomerManager row = new CustomerManager();
                row.setCid(rs.getString(1));
                row.setPwd(rs.getString(2));
                row.setCname(rs.getString(3));
                row.setCcontact(rs.getString(4));
                row.setCstatus(rs.getString(5));
                list.add(row);
            }
            return list;
        }
        return list;
    }
    
    // validate Customer
    
    public static int validate(String id,String pass) throws Exception
    {
        List<CustomerManager> list = CustomerManager.getRecords("SELECT * FROM CustomerMaster");
        for(int i=0;i<list.size();i++)
        {
            if( list.get(i).getCid().equals(id) && list.get(i).getPwd().equals(pass) )
            {
                if(list.get(i).getCstatus().equals("ENABLE"))
                {
                    // verify confirm
                    return 1;
                }
                else
                {
                    // verify bt disable by admin
                    return 2;
                }
            }
        }
        return 0;
    }
}
