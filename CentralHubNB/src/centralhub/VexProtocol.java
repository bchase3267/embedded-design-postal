/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package centralhub;

/**
 *
 * @author brian
 */
public class VexProtocol {

    public VexProtocol() {
        
    }
       
    StringPair processAndroidInput(String fromAndroid)
    {
        StringPair outputStrings = null;
        
        return outputStrings;
    }
}

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
}
