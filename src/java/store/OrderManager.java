/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package store;
import java.sql.*;
import java.util.*;
/**
 *
 * @author Dell
 */
public class OrderManager
{
    private int oid,pid,qty;
    private float atm,tax;
    private String orderdate,cid,status,paymode;
    
    public OrderManager(){}

    /**
     * @return the oid
     */
    public int getOid() {
        return oid;
    }

    /**
     * @param oid the oid to set
     */
    public void setOid(int oid) {
        this.oid = oid;
    }

    /**
     * @return the cid
     */
    public String getCid() {
        return cid;
    }

    /**
     * @param caid the cid to set
     */
    public void setCid(String cid) {
        this.cid = cid;
    }

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
     * @return the qty
     */
    public int getQty() {
        return qty;
    }

    /**
     * @param qty the qty to set
     */
    public void setQty(int qty) {
        this.qty = qty;
    }

    /**
     * @return the atm
     */
    public float getAtm() {
        return atm;
    }

    /**
     * @param atm the atm to set
     */
    public void setAtm(float atm) {
        this.atm = atm;
    }

    /**
     * @return the tax
     */
    public float getTax() {
        return tax;
    }

    /**
     * @param tax the tax to set
     */
    public void setTax(float tax) {
        this.tax = tax;
    }

    /**
     * @return the orderdate
     */
    public String getOrderdate() {
        return orderdate;
    }

    /**
     * @param orderdate the orderdate to set
     */
    public void setOrderdate(String orderdate) {
        this.orderdate = orderdate;
    }

    /**
     * @return the status
     */
    public String getStatus() {
        return status;
    }

    /**
     * @param status the status to set
     */
    public void setStatus(String status) {
        this.status = status;
    }

    /**
     * @return the paymode
     */
    public String getPaymode() {
        return paymode;
    }

    /**
     * @param paymode the paymode to set
     */
    public void setPaymode(String paymode) {
        this.paymode = paymode;
    }
    
    // manipulate Table
    
    // insert Record
    public void insertRecord() throws Exception
    {
        ShopManager.executeUpdate("INSERT INTO OrderMaster VALUES("+oid+",'"+orderdate+"',"+pid+",'"+status+"',"+qty+",'"+paymode+"',"+atm+","+tax+",'"+cid+"')");
    }
    
    // update Record
    
    public void updateRecord() throws Exception
    {
        ShopManager.executeUpdate("UPDATE OrderMaster set orderdate='"+orderdate+"',pid="+pid+",status='"+status+"',qty="+qty+",paymode='"+paymode+"',atm="+atm+",tax="+tax+",cid='"+cid+"' WHERE oid="+oid+" ");
    }
    
    //delete Record
    
    public void deleteRecord() throws Exception
    {
        ShopManager.executeUpdate("DELETE FROM OrderMaster WHERE oid="+oid+"");
    }
    
    // get Record From Table
    
    public OrderManager getRecord() throws Exception
    {
        ResultSet rs = ShopManager.executeQuery("SELECT * FROM OrderMaster WHERE oid="+oid+" ");
        OrderManager row = new OrderManager();
        rs.next();
        row.setOid(rs.getInt(1));
                   row.setOid(rs.getInt(1));
            row.setOrderdate(rs.getString(2));
            row.setPid(rs.getInt(3));
            row.setStatus(rs.getString(4));
            row.setQty(rs.getInt(5));
            row.setPaymode(rs.getString(6));
            row.setAtm(rs.getFloat(7));
            row.setTax(rs.getFloat(8));
            row.setCid(rs.getString(9));
        return row;
    }
    
    // get All Record From Table
    
     public static List<OrderManager> getRecords(String qry) throws Exception
    {
        List<OrderManager> list = new ArrayList<>();
        ResultSet rs = ShopManager.executeQuery(qry);
        while(rs.next())
        {
            OrderManager row = new OrderManager();
            row.setOid(rs.getInt(1));
            row.setOrderdate(rs.getString(2));
            row.setPid(rs.getInt(3));
            row.setStatus(rs.getString(4));
            row.setQty(rs.getInt(5));
            row.setPaymode(rs.getString(6));
            row.setAtm(rs.getFloat(7));
            row.setTax(rs.getFloat(8));
            row.setCid(rs.getString(9));
            list.add(row);
        }   
        return list;
    }
     
     
    public static int getNewId() throws Exception
    {
        
        ResultSet rs = ShopManager.executeQuery("SELECT max(oid) FROM OrderMaster");
        if(rs==null)
         return 100;
     
     rs.next();
     int n=rs.getInt(1);
     rs.close();
     return n+1;    
    }
}
