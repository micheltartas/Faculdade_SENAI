package principal;

import java.sql.*;
import javax.swing.*;

public class BD {
	public Connection connection = null;
	private final String DRIVER =  "org.postgresql.Driver"; 
	private final String DBNAME = "agenda";
	private final String URL = "jdbc:postgresql://localhost:5432/" + DBNAME;
	private final String LOGIN = "postgres";
	private final String SENHA = "root";

	public boolean getConnection(){
		try {
			Class.forName(DRIVER);
			connection = DriverManager.getConnection(URL, LOGIN, SENHA);
			System.out.println("Conectou");			
			return true;		
		} catch (ClassNotFoundException erro){
			System.out.println("Driver n�o encontrado!\n" + erro.toString());
			return false;
		} catch (SQLException erro){
			System.out.println("Problemas na conex�o com a fonte de dados\n" + erro.toString());		
			return false;		
		}
	}
	
	public void close(){
		try {
			connection.close();
			System.out.println("Desconectou");					
		} catch (SQLException erro){
			JOptionPane.showMessageDialog(null, "Problemas na conex�o\n" + erro.toString());			
		}		
	}
}