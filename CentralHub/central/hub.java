package central;


import jssc.SerialPortList;
public class hub {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		
		String portList[];
		try
		{
		portList = SerialPortList.getPortNames();
		}
		catch(NullPointerException e)
		{
			portList = new String[1];
			portList[0] = "";
			
		}
		/*if(portList.length > 0)
		{
			for(int i=0;i<portList.length;i++)
			{
				System.out.print(portList[i]);
			}
		}*/

	}
}