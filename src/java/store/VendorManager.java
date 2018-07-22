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
public class VendorManager
{
    private String vid,pwd,vname,vstatus;
    private String vcontact;

    public VendorManager()
    {
    }
    
    /**
     * @return the vid
     */
    public String getVid() {
        return vid;
    }

    /**
     * @param vid the vid to set
     */
    public void setVid(String vid) {
        this.vid = vid;
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
     * @return the vname
     */
    public String getVname() {
        return vname;
    }

    /**
     * @param vname the vname to set
     */
    public void setVname(String vname) {
        this.vname = vname;
    }


    /**
     * @return the vstatus
     */
    public String getVstatus() {
        return vstatus;
    }

    /**
     * @param vstatus the vstatus to set
     */
    public void setVstatus(String vstatus) {
        this.vstatus = vstatus;
    }

    /**
     * @return the vcontact
     */
    public String getVcontact() {
        return vcontact;
    }

    /**
     * @param vcontact the vcontact to set
     */
    public void setVcontact(String vcontact) {
        this.vcontact = vcontact;
    }
   
    // manipulate table
    
    
    // insert into Table
    
    public void insertRecord() throws Exception
    {
        ShopManager.executeUpdate("INSERT INTO VendorMaster VALUES( '"+vid+"','"+pwd+"','"+vname+"','"+vcontact+"','"+vstatus+"')");
    }
    
    // update the record
    
    public void updateRecord() throws Exception
    {
        ShopManager.executeUpdate("UPDATE VendorMaster set  pwd='"+pwd+"',vname='"+vname+"',vcontact='"+vcontact+"',vstatus='"+vstatus+"' WHERE vid='"+vid+"'");
    }
    
    // delete record from table
    
    public void deleteRecord() throws Exception
    {
        ShopManager.executeUpdate("DELETE FROM VendorMaster WHERE vid='"+vid+"'");
    }
    
    // get record From table
    
    public VendorManager getRecord() throws Exception
    {
        ResultSet rs =  ShopManager.executeQuery("SELECT * FROM VendorMaster WHERE vid='"+vid+"'");
        VendorManager row = new VendorManager();
        if(rs!=null)
        {
            rs.next();
            row.setVid(rs.getString(1));
            row.setPwd(rs.getString(2));
            row.setVname(rs.getString(3));
            row.setVcontact(rs.getString(4));
            row.setVstatus(rs.getString(5));
            return row;
        }
        return row;
    }
    
    // get all Record From Table
    
    public static List<VendorManager> getRecords(String qry) throws Exception 
    {
        List<VendorManager> list = new ArrayList<>();
        ResultSet rs = ShopManager.executeQuery(qry);
        if(rs!=null)
        {
            while(rs.next())
            {
                VendorManager row = new VendorManager();
                row.setVid(rs.getString(1));
                row.setPwd(rs.getString(2));
                row.setVname(rs.getString(3));
                row.setVcontact(rs.getString(4));
                row.setVstatus(rs.getString(5));
                list.add(row);
            }
            return list;
        }
        return list;
    }
    
    // validate Vendor
    
    public static int validate(String id,String pass) throws Exception
    {
        List<VendorManager> list = VendorManager.getRecords("SELECT * FROM VendorMaster");
        for(int i=0;i<list.size();i++)
        {
            if( list.get(i).getVid().equals(id) && list.get(i).getPwd().equals(pass) )
            {
                if(list.get(i).getVstatus().equals("ENABLE"))
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
