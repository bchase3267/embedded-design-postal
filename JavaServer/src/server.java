import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.Serializable;
import java.net.ServerSocket;
import java.net.Socket;
public class server {
public static void main(String[] args) throws IOException{
	
	class Command implements Serializable
    {
    	public String command;
    	public double longitude;
    	public double latitude;
    	public double compass;
    	
    	Command(String _command, double _longitude, double _latitude, double _compass)
    	{
    		command = _command;
    		longitude = _longitude;
    		latitude = _latitude;
    		compass = _compass;
    	}
    }
	
	
    String recvsentence = null;
    String sendsentence = null;

    
    ServerSocket server=new ServerSocket(5000);
    do
    {
    System.out.println("waiting for client");

    Socket sock = server.accept();
    System.out.println("Client Connected with IP Address");

    DataInputStream dis = new DataInputStream(sock.getInputStream());

    DataOutputStream dos = new DataOutputStream(sock.getOutputStream());
    String test = "";
    do
    {
    try {
    recvsentence = dis.readUTF();

    System.out.println("Got Data");
    System.out.println(recvsentence);
    test = recvsentence;
    } catch (Exception e){}
    } while (!test.equals("close"));
    sock.close();
    } while (true);
    //sendsentence = recvsentence+" changed";

    //System.out.println("Message Altered");

    //dos.writeUTF(sendsentence);

    //System.out.println("Data sent");
    //sock.close();

    //server.close();

}
}