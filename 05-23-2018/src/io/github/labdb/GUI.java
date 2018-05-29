package io.github.labdb;

import javax.swing.*;
import java.awt.*;
import java.awt.event.*;
import java.util.Collection;
import java.util.Map;
import java.util.WeakHashMap;

public class GUI implements ActionListener {
	private JFrame frame;
	
	public GUI() {
		JFrame.setDefaultLookAndFeelDecorated(true);
		frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		
		frame.add(this.getLoginScreen());
		frame.setVisible(true);
	}
	
	private Component getLoginScreen() {
		JPanel panel = new JPanel(new GridLayout(0, 1));
		
		Map<String, Component> components = new WeakHashMap<String, Component>();
		
		components.put("errorLabel", new JLabel("Errore: Dati non corretti!"));
		JLabel error = (JLabel) components.get("errorLabel");
		error.setForeground(new Color(255, 0, 0));
		error.setVisible(false);
		
		components.put("userLabel", new JLabel("Nome utente:"));
		components.put("userField", new JTextField(32));
		((JLabel) components.get("userLabel")).setLabelFor(components.get("userField"));
		
		components.put("passwordLabel", new JLabel("Password:"));
		components.put("passwordField", new JPasswordField(32));
		((JLabel) components.get("passwordLabel")).setLabelFor(components.get("passwordField"));
		
		components.put("loginButton", new JButton("Accedi"));
		JButton b = (JButton) components.get("loginButton");
		b.setMnemonic(KeyEvent.VK_I);
		b.addActionListener(this);
		
		panel.setBorder(BorderFactory.createEmptyBorder(30, 30, 10, 30));
		
		return addPanelComponents(panel, components.values());
	}
	
	private static Component addPanelComponents(JPanel p, Collection<Component> components) {
		for (Component c : components) {
			p.add(c);
		}
		
		return p;
	}

	@Override
	public void actionPerformed(ActionEvent event) {
		// TODO Auto-generated method stub
		
	}
}
