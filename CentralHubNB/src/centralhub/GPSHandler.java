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
    private double longitudeDegrees;
    private double latitudeDegrees;
    
    public GPSCoordinates()
    {
        longitudeDegrees = 0.0;
        latitudeDegrees = 0.0;
    }        
    
    public GPSCoordinates(String joined)
    {
        String Longitude, Latitude;
        
        
    }
    
    public GPSCoordinates(String Longitude, String Latitude)
    {
        longitudeDegrees = Double.parseDouble(Longitude);
        latitudeDegrees = Double.parseDouble(Latitude);
    }
    
    public double getLongitudeDegrees()
    {
        return longitudeDegrees;        
    }
    
    public double getLatitudeDegrees()
    {
        return latitudeDegrees;
    }
}