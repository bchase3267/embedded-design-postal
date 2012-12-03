package centralhub;

import java.awt.EventQueue;

import javax.swing.JFrame;
import javax.swing.JSlider;
import java.awt.BorderLayout;
import javax.swing.JPanel;
import javax.swing.JButton;
import java.awt.FlowLayout;
import java.awt.GridLayout;
import com.jgoodies.forms.layout.FormLayout;
import com.jgoodies.forms.layout.ColumnSpec;
import com.jgoodies.forms.layout.RowSpec;
import com.jgoodies.forms.factories.FormFactory;
import javax.swing.BoxLayout;
import javax.swing.JComboBox;
import java.awt.event.MouseAdapter;
import java.awt.event.MouseEvent;

import jssc.*;

public class Hub {

	private JFrame frmTeamPostalVex;

	private SerialPort vexPort;
	private String[] listOfPorts;
	/**
	 * Launch the application.
	 */
	public static void main(String[] args) {
		EventQueue.invokeLater(new Runnable() {
			public void run() {
				try {
					Hub window = new Hub();
					window.frmTeamPostalVex.setVisible(true);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		});
	}

	/**
	 * Create the application.
	 */
	public Hub() {
		initialize();
		
			
	}

	/**
	 * Initialize the contents of the frame.
	 */
	private void initialize() {
		frmTeamPostalVex = new JFrame();
		frmTeamPostalVex.setTitle("Team Postal Vex Hub");
		frmTeamPostalVex.getContentPane().setLayout(new FormLayout(new ColumnSpec[] {
				ColumnSpec.decode("448px:grow"),},
			new RowSpec[] {
				RowSpec.decode("31px"),
				RowSpec.decode("max(150dlu;default):grow"),}));
		frmTeamPostalVex.setSize(450, 400);
		
		JSlider slider = new JSlider();
		slider.setToolTipText("Velocity");
		slider.setPaintLabels(true);
		slider.setMaximum(127);
		slider.setMajorTickSpacing(10);
		frmTeamPostalVex.getContentPane().add(slider, "1, 1, fill, top");
		
		JPanel panel = new JPanel();
		frmTeamPostalVex.getContentPane().add(panel, "1, 2, fill, fill");
		panel.setLayout(new FormLayout(new ColumnSpec[] {
				FormFactory.RELATED_GAP_COLSPEC,
				FormFactory.DEFAULT_COLSPEC,
				FormFactory.RELATED_GAP_COLSPEC,
				FormFactory.DEFAULT_COLSPEC,
				FormFactory.RELATED_GAP_COLSPEC,
				FormFactory.DEFAULT_COLSPEC,
				FormFactory.RELATED_GAP_COLSPEC,
				FormFactory.DEFAULT_COLSPEC,
				FormFactory.RELATED_GAP_COLSPEC,
				ColumnSpec.decode("default:grow"),
				FormFactory.RELATED_GAP_COLSPEC,
				FormFactory.DEFAULT_COLSPEC,
				FormFactory.RELATED_GAP_COLSPEC,
				FormFactory.DEFAULT_COLSPEC,
				FormFactory.RELATED_GAP_COLSPEC,
				FormFactory.DEFAULT_COLSPEC,
				FormFactory.RELATED_GAP_COLSPEC,
				FormFactory.DEFAULT_COLSPEC,},
			new RowSpec[] {
				FormFactory.RELATED_GAP_ROWSPEC,
				FormFactory.DEFAULT_ROWSPEC,
				FormFactory.RELATED_GAP_ROWSPEC,
				FormFactory.DEFAULT_ROWSPEC,
				FormFactory.RELATED_GAP_ROWSPEC,
				FormFactory.DEFAULT_ROWSPEC,
				FormFactory.RELATED_GAP_ROWSPEC,
				FormFactory.DEFAULT_ROWSPEC,
				FormFactory.RELATED_GAP_ROWSPEC,
				FormFactory.DEFAULT_ROWSPEC,
				FormFactory.RELATED_GAP_ROWSPEC,
				FormFactory.DEFAULT_ROWSPEC,
				FormFactory.RELATED_GAP_ROWSPEC,
				FormFactory.DEFAULT_ROWSPEC,
				FormFactory.RELATED_GAP_ROWSPEC,
				FormFactory.DEFAULT_ROWSPEC,}));
		
		JButton btnForward = new JButton("Forward");
		btnForward.addMouseListener(new MouseAdapter() {
			@Override
			public void mousePressed(MouseEvent e) {
			}
		});
		panel.add(btnForward, "10, 4, 1, 3");
		
		JButton btnLeft = new JButton("Left");
		panel.add(btnLeft, "8, 6, 1, 5");
		
		JButton btnRight = new JButton("Right");
		panel.add(btnRight, "12, 6, 1, 5");
		
		JButton btnStop = new JButton("Stop");
		panel.add(btnStop, "10, 8, 1, 3");
		
		JButton btnBackward = new JButton("Backward");
		panel.add(btnBackward, "10, 12, 1, 3");
		
		final JComboBox comboBoxPorts = new JComboBox();
		panel.add(comboBoxPorts, "10, 16, fill, default");
		
		JButton btnOpenPort = new JButton("Open Port");
		btnOpenPort.addMouseListener(new MouseAdapter() {
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
		panel.add(btnOpenPort, "2, 16, 7, 1");
		
		
		
		listOfPorts = SerialPortList.getPortNames();
		int N = listOfPorts.length;
		for(int i=0;i<N;i++)
		{
			comboBoxPorts.addItem(listOfPorts[i]);
		}	
	}


}
