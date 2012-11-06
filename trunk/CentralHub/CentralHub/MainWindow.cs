using System;
using Gtk;
using System.IO.Ports;

static class c
{
	public const byte OFFSET = 127;
	public const byte SOH = (1 + OFFSET);    // start of heading
	public const byte STX = (2 + OFFSET);    // start of text
	public const byte ETX = (3 + OFFSET);    // end of text
	public const byte EOT = (4 + OFFSET);    // end of transmission
	public const byte ENQ = (5 + OFFSET);    // enquire
	public const byte ACK = (6 + OFFSET);    // acknowledge
	public const byte NAK = (21 + OFFSET);   // negative acknowlege
	public const byte ESC = (33 + OFFSET);   // escape transmission
}

public partial class MainWindow: Gtk.Window
{	
	public SerialPort vexPort;
	public string[] portNames;

	public MainWindow (): base (Gtk.WindowType.Toplevel)
	{
		Build ();
		//System.IO.Ports.
		portNames = SerialPort.GetPortNames();
		int N = portNames.Length;

		for (int i=0; i<N; i++) {
			comboboxPort.InsertText(i,portNames[i]);
		}
	}
	
	protected void OnDeleteEvent (object sender, DeleteEventArgs a)
	{
		Application.Quit ();
		a.RetVal = true;
	}

	protected void clickForward (object sender, EventArgs e)
	{
		string output = "";
		if (vexPort != null) {
			if(spinbuttonSeconds.ValueAsInt == 0)
				output = string.Concat("w1",(char)hscaleSpeed.Value,c.ESC);
			else
				output = string.Concat("ws",(char)hscaleSpeed.Value, spinbuttonSeconds.ValueAsInt,c.ESC);

			vexPort.Write(output);
		}

	}	

	protected void clickBackward (object sender, EventArgs e)
	{
		string output = "";
		if (vexPort != null) {
			if(spinbuttonSeconds.ValueAsInt == 0)
				output = string.Concat("s1",(byte)hscaleSpeed.Value,c.ESC);
			else
				output = string.Concat("ss",(byte)hscaleSpeed.Value, spinbuttonSeconds.ValueAsInt,c.ESC);
		
			vexPort.Write(output);
		}
	}	

	protected void clickRotateRight (object sender, EventArgs e)
	{
		string output = "";
		if (vexPort != null) {
			if(spinbuttonSeconds.ValueAsInt == 0)
				output = string.Concat("d1",(byte)hscaleSpeed.Value,c.ESC);
			else
				output = string.Concat("ds",(byte)hscaleSpeed.Value, spinbuttonSeconds.ValueAsInt,c.ESC);

			vexPort.Write(output);
		}
	}	

	protected void clickRotateLeft (object sender, EventArgs e)
	{
		string output = "";
		if (vexPort != null) {
			if(spinbuttonSeconds.ValueAsInt == 0)
				output = string.Concat("a1",(byte)hscaleSpeed.Value,c.ESC);
			else
				output = string.Concat("as",(byte)hscaleSpeed.Value, spinbuttonSeconds.ValueAsInt,c.ESC);
		
		vexPort.Write(output);
		}
	}	

	protected void clickStop (object sender, EventArgs e)
	{
		string output;
		if (vexPort != null) {
			output = string.Concat("a1",(char)0,c.ESC);
			vexPort.Write (output);
		}
	}	

	protected void clickPortLink (object sender, EventArgs e)
	{
		if (comboboxPort.ActiveText != "") {

			string output = "";
			if(vexPort != null)	{
				vexPort.Close();
			}

			vexPort = new SerialPort(comboboxPort.ActiveText,115200,Parity.None,
			                         8 /*databits*/, StopBits.One);
			try
			{
				vexPort.Open ();
				output = string.Concat(c.SOH,(byte)0);
				vexPort.Write(output);
			}
			catch(Exception)
			{
				//comboboxPort.ActiveText = "Port " + comboboxPort.ActiveText + "failed to open!";
			}
		}
	}	



}