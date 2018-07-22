/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package store;
import java.util.Calendar;

/**
 *
 * @author Dell
 */
public class DateManager
{
    public static String getDdmmyyyy(java.util.Date date)
    {
        String str = "";
        Calendar cal = Calendar.getInstance();
        cal.setTimeInMillis(date.getTime());
        str = cal.get(Calendar.DATE)+"/"+cal.get(Calendar.MONTH+1)+"/"+cal.get(Calendar.YEAR);
        return str;
    }
    
    public static String getYyyymmdd(java.util.Date dt)
    {
        String str="";
        java.util.Calendar cal=java.util.Calendar.getInstance();
        cal.setTimeInMillis(dt.getTime());
        str=cal.get(Calendar.YEAR)+"-"+(cal.get(Calendar.MONTH)+1)+"-"+cal.get(Calendar.DATE);
        return str;
    }
    
}
