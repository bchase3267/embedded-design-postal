package java_server;
import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.IOException;
import java.net.ServerSocket;
import java.net.Socket;
public class server {
public static void main(String[] args) throws IOException{
    String recvsentence = null;
    String sendsentence = null;


    ServerSocket server=new ServerSocket(5000);

    System.out.println("waiting for client");

    Socket sock = server.accept();
    System.out.println("Client Connected with IP Address");

    DataInputStream dis = new DataInputStream(sock.getInputStream());

    DataOutputStream dos = new DataOutputStream(sock.getOutputStream());

    recvsentence = dis.readUTF();

    System.out.println("Got Data");
    System.out.println(recvsentence);
    sendsentence = recvsentence+" changed";

    System.out.println("Message Altered");

    dos.writeUTF(sendsentence);

    System.out.println("Data sent");
    sock.close();

    server.close();

}
}