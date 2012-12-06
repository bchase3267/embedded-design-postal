/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package centralhub;

import java.util.Queue;
import jssc.SerialPort;

/**
 *
 * @author brian
 */
public class VexProtocol {

    private SerialPort vexPort;
    private Queue<String> commands;
    public VexProtocol() {
        vexPort = null;
    }
   
    
    public String processAndroidInput(String fromAndroid)
    {
        String outputStrings = null;
        try
        {
            vexPort.writeString(fromAndroid);
        }
        catch(Exception e)
        {
            
        }
        
        return outputStrings;
    }
    
    public boolean connectSerialPort(SerialPort newPort)
    {
        try
        {
            vexPort = newPort;
        }
        catch(Exception e)
        {
            return false;
        }
        return true;
            
    }
}
/*
class StringPair
{
    private String toAndroid;
    private String toVex;
    
    public StringPair()
    {
        this.toAndroid = null;
        this.toVex = null;
    }
    
    public StringPair(String forAndroid,String forVex)
    {
        this.toAndroid = forAndroid;
        this.toVex = forVex;
    }
    
    public String getForAndroid()
    {
        return toAndroid;
    }
            
    public String getForVex()
    {
        return toVex;
    }
   
}*/
