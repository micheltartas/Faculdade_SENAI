package principal;

import java.awt.*;
import java.sql.*;
import java.awt.event.*;
import javax.swing.*;

public class TelaLogin {
	
	private JFrame frame;
	//private TelaLogin tela;
	//private static MenuPrincipal telaInicial;
	//private MenuBarClass bar;
	private BD bd;

	private JTextField username;
	private JPasswordField senha;
	private JLabel titulo, titleImageLabel, userlabel, senhalabel;
	private JButton entrar, cadastrar;

	private PreparedStatement statement;
	private ResultSet resultSet;
	
	
	public TelaLogin() {
		montarTela();
	}
	
	private void montarTela(){
		frame = new JFrame("Login");
		frame.setLayout(null);
		frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		frame.getContentPane().setBackground(new Color(47, 161, 197));
		inicializarComponentes();
		definirEventos();

		frame.pack();
		frame.setBounds(350,150,700,450);
		frame.setVisible(true);
		bd = new BD();
	}
	
	private void inicializarComponentes(){
		
		Font f = new Font("SansSerif", Font.BOLD, 40);
		titulo = new JLabel("Login");
		titulo.setForeground(new Color(255, 255, 255));
		titulo.setFont(f);
		titulo.setBounds(230, 60, 230, 45);
		frame.add(titulo);

		titleImageLabel = new JLabel();
		titleImageLabel.setIcon(new javax.swing.ImageIcon(getClass().getResource("/icones/user_login.png")));
		titleImageLabel.setBounds(55, 100, 250, 140);
		frame.add(titleImageLabel);

		userlabel = new JLabel("Nome de Usu�rio");
		userlabel.setForeground(new Color(255, 255, 255));
		userlabel.setFont(new Font("SansSerif", Font.BOLD, 18));
		username = new JTextField();
		username.setForeground(new Color(255, 255, 255));
		username.setBackground(new Color(0, 130, 156));
		username.setFont(new Font("SansSerif", Font.BOLD, 16));
		userlabel.setBounds(235,115,240,35);
		username.setBounds(235,145,385,35);
		frame.add(username);
		frame.add(userlabel);

		senhalabel = new JLabel("Senha");
		senhalabel.setForeground(new Color(255, 255, 255));
		senha = new JPasswordField();
		senha.setBackground(new Color(0, 130, 156));
		senha.setForeground(new Color(255, 255, 255));
		senha.setFont(new Font("SansSerif", Font.BOLD, 14));
		senhalabel.setFont(new Font("SansSerif", Font.BOLD, 17));
		senhalabel.setBounds(235,190,150,30);
		senha.setBounds(235,220,385,35);
		frame.add(senha);
		frame.add(senhalabel);

		cadastrar = new JButton("Cadastre-se");
		cadastrar.setBackground(new Color(0, 130, 156));
		cadastrar.setForeground(new Color(255, 255, 255));
		cadastrar.setFont(new Font("SansSerif",1, 16));
		cadastrar.setIcon(new javax.swing.ImageIcon(getClass().getResource("/icones/users.png")));
		cadastrar.setHorizontalTextPosition(JButton.LEFT);
		cadastrar.setFocusPainted(false);
		cadastrar.setBounds(245,275,200,50);
		frame.add(cadastrar);

		entrar = new JButton("Entrar");
		entrar.setBackground(new Color(0, 130, 156));
		entrar.setForeground(new Color(255, 255, 255));
		entrar.setFont(new Font("SansSerif",1, 16));
		entrar.setIcon(new javax.swing.ImageIcon(getClass().getResource("/icones/login.png")));
		entrar.setHorizontalTextPosition(JButton.LEFT);
		entrar.setFocusPainted(false);

		entrar.setBounds(450,275,156,50);
		frame.add(entrar);
	}
	
	private void definirEventos(){

		entrar.addActionListener(new ActionListener(){
			public void actionPerformed(ActionEvent e){
				
				if((username.getText().trim().equals("")) && (senha.getText().trim().equals(""))){
					JOptionPane.showMessageDialog(null, "Verifique se algum campo esta vazio!");
				} else {
					try {
						if(!bd.getConnection()){
							JOptionPane.showMessageDialog(null, "Falha na conexao! Fechando o Sistema!");
							System.exit(0);
						}
						String url = "SELECT * FROM users WHERE nome=? AND senha=?";
						statement = bd.connection.prepareStatement(url);
						statement.setString(1, username.getText());
						statement.setString(2, senha.getText());
						resultSet = statement.executeQuery();
						if(resultSet.next()){
							String nome = resultSet.getString("nome");
							JOptionPane.showMessageDialog(null, "Usuario logado com sucesso \n Nome: " + nome);
							//telaInicial = new MenuPrincipal();
							frame.dispose();
						} else {
							JOptionPane.showMessageDialog(null, "Nenhum usuario com esse Nome e/ou Senha foi encontrado!");
						}
						resultSet.close();
						statement.close();
						bd.close();
					} catch(Exception erro) {
						JOptionPane.showMessageDialog(null, "Algo de errado aconteceu:\n " + erro.toString());
					}
				}
			}
		});

		cadastrar.addActionListener(new ActionListener(){
			public void actionPerformed(ActionEvent e){
				TelaCadastro cadastroFrame = new TelaCadastro();
			}
		});
	}
}
