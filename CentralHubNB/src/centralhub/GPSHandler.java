/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package centralhub;

import java.util.Queue;


/**
 *
 * @author brian
 */
public class GPSHandler {
    private Queue<GPSCoordinates> coordinates;
    
    private GPSCoordinates homeGPS;

    /**
     *
     * @param home
     */
    public GPSHandler(GPSCoordinates home) {
        homeGPS = home;
    }
    
    
    
}
class GPSCoordinates
{
    private double longitude;
    private double latitude;
    
    public GPSCoordinates(String joined)
    {
        
    }
}