/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package centralhub;

import java.net.*;
import java.io.*;

/**
 *
 * @author brian
 */
public class CommandServer implements Runnable{
    private ServerSocket serverSocket = null;
    private Socket clientSocket = null;
    private PrintWriter output = null;
    private BufferedReader input = null;
    
    private VexProtocol vexPro;
    
    private int serverSocketNumber = 5000;
    private String inLine, outLine;
    
    
    public void setupPort()
    {
        try {
            serverSocket = new ServerSocket(serverSocketNumber);
        } catch (IOException e) {
            System.err.println("Could not listen on port: ".concat(
                    Integer.toString(serverSocketNumber)));
            System.exit(1);
        }
        
        try {
            System.out.println("Waiting for a client to connect!");
            clientSocket = serverSocket.accept();
            if(clientSocket.isConnected())
            {
                System.out.println("Client is connected!");
            }
                
        } catch (IOException e) {
            System.err.println("Accept failed.");
            System.exit(1);
        }
        try
        {
            output = new PrintWriter(clientSocket.getOutputStream(), true);
            input = new BufferedReader(new InputStreamReader(
				clientSocket.getInputStream()));
            
            vexPro = new VexProtocol();
            outLine = "";   ////////////////////////
        }
        catch(Exception e)
        {
            
        }
        
        
    }
    
    /**
     *
     */
    @Override
    public void run()
    {
        try
        {
            while((inLine = input.readLine()) != null)
            {
                if(inLine != null)
                {
                    if(!inLine.isEmpty())
                    {
                        vexPro.processAndroidInput(inLine);
                    }
                }
                
            }
        }
        catch(Exception e)
        {
            
        }
        
        closePorts();
    }
    
    public void closePorts()
    {
       try
       {
           output.close();
           input.close();
           clientSocket.close();
           serverSocket.close();                   
                   
       }
       catch(Exception e)
       {
           
       }
    }
    
}
