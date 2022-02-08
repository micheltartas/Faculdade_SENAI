package banco;

import java.util.Scanner;

public class Main{
	public static void main(String[] args) {

		int opcao = 0;
		
		Scanner entrada = new Scanner (System.in);
		Conta minhaConta = new Conta();
		
		System.out.println("Digite o numero de sua conta: ");
		minhaConta.numero = entrada.nextInt();
		entrada.nextLine();	//Corrige o bug do /n
		
		//String lixo = entrada.nextLine();
		
		System.out.println("Digite o nome do titular da conta: ");
		minhaConta.dono = entrada.nextLine();
		
		System.out.println("\nConta do: " + minhaConta.dono);
		
		System.out.println("Digite o saldo inicial dessa conta: ");
		minhaConta.saldo = entrada.nextDouble();

		while (opcao != 4) {

			System.out.println(
				"=> Menu\n" +
				"> Escolha a Opcao Desejada\n" +
				"> 1 - Verificar Saldo\n> 2 - Sacar\n> 3 - Depositar\n> 4 - Sair\n"
			);
			opcao = entrada.nextInt();
			
			switch(opcao){
				case 1  : minhaConta.saldo(); 										break;
				case 2  : minhaConta.saca(minhaConta.recebeValor(entrada));			break;
				case 3  : minhaConta.deposita(minhaConta.recebeValor(entrada));		break;
				default : 															break;
			}
		}
		entrada.close();
	}
}
