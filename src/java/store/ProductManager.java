/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package store;
import java.util.*;
import java.sql.*;
/**
 *
 * @author Dell
 */
public class ProductManager
{
    private int pid,bid,caid,quantity;
    private float price;
    private String pname,vid,model;
    
    public ProductManager(){}

    /**
     * @return the pid
     */
    public int getPid() {
        return pid;
    }

    /**
     * @param pid the pid to set
     */
    public void setPid(int pid) {
        this.pid = pid;
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
     * @return the quantity
     */
    public int getQuantity() {
        return quantity;
    }

    /**
     * @param quantity the quantity to set
     */
    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    /**
     * @return the price
     */
    public float getPrice() {
        return price;
    }

    /**
     * @param price the price to set
     */
    public void setPrice(float price) {
        this.price = price;
    }

    /**
     * @return the pname
     */
    public String getPname() {
        return pname;
    }

    /**
     * @param pname the pname to set
     */
    public void setPname(String pname) {
        this.pname = pname;
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
     * @return the model
     */
    public String getModel() {
        return model;
    }

    /**
     * @param model the model to set
     */
    public void setModel(String model) {
        this.model = model;
    }
    
    // manipulate Table
    
    // insert Record
    
    public void insertRecord() throws Exception
    {
        ShopManager.executeUpdate("INSERT INTO ProductMaster VALUES( "+pid+",'"+pname+"',"+bid+","+caid+","+quantity+",'"+vid+"','"+model+"',"+price+" )");
    }
    
    // update Record
    
    public void updateRecord() throws Exception
    {
        ShopManager.executeUpdate("UPDATE ProductMaster set pid="+pid+",pname='"+pname+"',bid="+bid+",caid="+caid+",quantity="+quantity+",vid='"+vid+"',model='"+model+"',price="+price+" ");
    }

    // delete Record
    
    public void deleteRecord() throws Exception
    {
        ShopManager.executeUpdate("DELETE FROM ProductMaster Where pid="+pid+"");
    }
    
    // get A Record From Table
    
    public ProductManager getRecord() throws Exception
    {
        ResultSet rs = ShopManager.executeQuery("SELECT * FROM ProductMaster WHERE pid="+pid+" ");
        ProductManager row = new ProductManager();
        rs.next();
        row.setPid(rs.getInt(1));
        row.setPname(rs.getString(2));
        row.setBid(rs.getInt(3));
        row.setCaid(rs.getInt(4));
        row.setQuantity(rs.getInt(5));
        row.setVid(rs.getString(6));
        row.setModel(rs.getString(7));
        row.setPrice(rs.getFloat(8));
        return row;
    }
    
    // get All Record
    
    public static List<ProductManager> getRecords(String qry) throws Exception
    {
        List<ProductManager> list = new ArrayList<>();
        ResultSet rs = ShopManager.executeQuery(qry);
        while(rs.next())
        {
            ProductManager row = new ProductManager();
            row.setPid(rs.getInt(1));
            row.setPname(rs.getString(2));
            row.setBid(rs.getInt(3));
            row.setCaid(rs.getInt(4));
            row.setQuantity(rs.getInt(5));
            row.setVid(rs.getString(6));
            row.setModel(rs.getString(7));
            row.setPrice(rs.getFloat(8));
            list.add(row);
        }
        return list;
    }
    
    
    public static List<String> getColumnData(String Column_Name) throws Exception
    {
        List<String> list = new ArrayList<>();
        String qry = "SELECT "+Column_Name+" FROM ProductMaster GROUP BY "+Column_Name+" ORDER BY "+Column_Name+"";
        ResultSet rs  = ShopManager.executeQuery(qry);
        while(rs.next())
        {
            String s = rs.getString(1);
            list.add(s);
        }
        return list;
    }
    
     public static int getNewId() throws Exception
    {
        ResultSet rs = ShopManager.executeQuery("SELECT max(pid) FROM ProductMaster");
       if(rs==null)
         return 100;
     
     rs.next();
     int n=rs.getInt(1);
     rs.close();
     return n+1;      
    }
    
    
    
}

