package banco;

import java.util.Scanner;

public class Conta {
	
	int numero;
	String dono;
	double saldo;
	
	void saldo(){
		System.out.println("Seu saldo atual R$ " + this.saldo +"\n");
	}

	double recebeValor(Scanner entrada){
		//Scanner entrada = new Scanner (System.in);
		
		System.out.println("Digite o valor R$: ");
		double valor = entrada.nextInt();
		entrada.nextLine();
		
		//entrada.close();
		return (valor);
	}

	boolean saca (double valor) {
		if(valor > this.saldo) {
			return (false);
		} else {
			this.saldo -= valor;
			return (true);
		}
	}
	
	void deposita (double valor) {
		this.saldo += valor;
	}
}
