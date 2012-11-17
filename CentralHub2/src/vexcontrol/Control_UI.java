package vexcontrol;
//import java.awt.BorderLayout;
import java.awt.EventQueue;

import javax.swing.JFrame;
import javax.swing.JPanel;
import javax.swing.border.EmptyBorder;
import javax.swing.JSlider;
import javax.swing.JLabel;
import javax.swing.SwingConstants;
import javax.swing.JButton;
import javax.swing.JComboBox;
import javax.swing.JSpinner;
import java.awt.event.MouseAdapter;
import java.awt.event.MouseEvent; 
//import java.io.*;
//import java.util.*;
import jssc.*;

import javax.swing.SpinnerNumberModel;


public class Control_UI extends JFrame {

	/**
	 * 
	 */
	
	private static final long serialVersionUID = 1973415962415322024L;
	private JPanel contentPane;
	private SerialPort vexPort;
	private String[] listOfPorts;
	public static char OFFSET = 127;
	public static char SOH = (char) (1 + OFFSET);    // start of heading
	public static char STX = (char) (2 + OFFSET);    // start of text
	public static char ETX = (char) (3 + OFFSET);    // end of text
	public static char EOT = (char) (4 + OFFSET);    // end of transmission
	public static char ENQ = (char) (5 + OFFSET);    // enquire
	public static char ACK = (char) (6 + OFFSET);    // acknowledge
	public static char NAK = (char) (21 + OFFSET);   // negative acknowledge
	public static char ESC = (char) (33 + OFFSET);   // escape transmission
	
	/**
	 * Launch the application.
	 */
	public static void main(String[] args) {
		EventQueue.invokeLater(new Runnable() {
			public void run() {
	
				try {
					Control_UI frame = new Control_UI();
					frame.setVisible(true);
					
				} catch (Exception e) {
					e.printStackTrace();
					System.out.println(e.toString());
				}
				
			}
			
		});
	}

	
	/**
	 * Create the frame.
	 */
	public Control_UI() {
		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		setBounds(100, 100, 443, 375);
		contentPane = new JPanel();
		contentPane.setBorder(new EmptyBorder(5, 5, 5, 5));
		setContentPane(contentPane);
		contentPane.setLayout(null);
		
		JLabel lblNewLabel = new JLabel("Velocity");
		lblNewLabel.setBounds(68, 109, 298, 15);
		contentPane.add(lblNewLabel);
		lblNewLabel.setHorizontalAlignment(SwingConstants.CENTER);
		
		final JSlider sliderSpeed = new JSlider();
		sliderSpeed.setMaximum(127);
		sliderSpeed.setPaintTicks(true);
		sliderSpeed.setPaintLabels(true);
		sliderSpeed.setMajorTickSpacing(10);
		sliderSpeed.setBounds(31, 55, 377, 42);
		contentPane.add(sliderSpeed);
		sliderSpeed.setBorder(null);
		lblNewLabel.setLabelFor(sliderSpeed);		

		
		JButton btnBackward = new JButton("Backward");
		btnBackward.setBounds(156, 210, 117, 25);
		contentPane.add(btnBackward);
		
		JButton btnLeft = new JButton("Left");
		btnLeft.setBounds(63, 158, 81, 77);
		contentPane.add(btnLeft);
		
		JButton btnRight = new JButton("Right");
		btnRight.setBounds(285, 164, 81, 71);
		contentPane.add(btnRight);
		
		final JComboBox comboBoxPorts = new JComboBox();
		comboBoxPorts.setEditable(true);
		comboBoxPorts.setBounds(178, 300, 95, 24);
		contentPane.add(comboBoxPorts);
		
		JButton btnStop = new JButton("Stop");
		btnStop.setBounds(156, 173, 117, 25);
		contentPane.add(btnStop);
		
		JSpinner spinnerSeconds1 = new JSpinner();
		spinnerSeconds1.setModel(new SpinnerNumberModel(50, 0, 240, 1));
		spinnerSeconds1.setBounds(205, 247, 37, 34);
		final JSpinner spinnerSeconds = spinnerSeconds1;
		contentPane.add(spinnerSeconds);
		
		JLabel lblSeconds = new JLabel("Seconds");
		lblSeconds.setBounds(126, 256, 70, 15);
		contentPane.add(lblSeconds);
		
		JLabel lblPort = new JLabel("Port");
		lblPort.setBounds(126, 304, 44, 15);
		contentPane.add(lblPort);
		
		JLabel lblTeamPos = new JLabel("Team Postal Vex Control");
		lblTeamPos.setBounds(129, 12, 180, 15);
		contentPane.add(lblTeamPos);
		
		JButton btnReturnHome = new JButton("Return");
		btnReturnHome.setBounds(299, 299, 117, 25);
		contentPane.add(btnReturnHome);
		
		listOfPorts = SerialPortList.getPortNames();
		int N = listOfPorts.length;
		for(int i=0;i<N;i++)
		{
			comboBoxPorts.addItem(listOfPorts[i]);
		}	
		
		JButton btnConnectPort = new JButton("Open Port");
		btnConnectPort.addMouseListener(new MouseAdapter() {
			@Override
			public void mouseClicked(MouseEvent e) {
				if(comboBoxPorts.getSelectedItem() != "")
				{
					if(vexPort != null)
					{
						try {
							if(vexPort.isOpened())
							vexPort.closePort();
						} catch (SerialPortException e1) {
							// TODO Auto-generated catch block
							e1.printStackTrace();
						}
					}
					try {
						vexPort = new SerialPort((String) comboBoxPorts.getSelectedItem());
						vexPort.openPort();
						vexPort.setParams(SerialPort.BAUDRATE_115200, SerialPort.DATABITS_8, SerialPort.STOPBITS_1, SerialPort.PARITY_NONE);
						
					} catch (SerialPortException e1) {
						// TODO Auto-generated catch block
						e1.printStackTrace();
					}					
				}		
			}
		});
		
		JButton btnNewButton = new JButton("Forward");
		btnNewButton.addMouseListener(new MouseAdapter() {
			@Override
			public void mouseClicked(MouseEvent e) {
				String output = "";
				if (vexPort != null) {
					if( (Integer)spinnerSeconds.getValue() == 0)
						output = "w1" + (char)sliderSpeed.getValue() + ETX;
					else
						output = "ws" + (char)sliderSpeed.getValue() + (Byte)spinnerSeconds.getValue() + ETX;

					try {
						vexPort.writeString(output);
					} catch (SerialPortException e1) {
						// TODO Auto-generated catch block
						e1.printStackTrace();
						System.out.println(e.toString());
					}
				}

				
			}
		});
		btnNewButton.setToolTipText("");
		btnNewButton.setBounds(156, 136, 117, 25);
		contentPane.add(btnNewButton);
		
		btnConnectPort.setBounds(12, 299, 106, 25);
		contentPane.add(btnConnectPort);
	}
}
