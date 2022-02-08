/*********************************************************************** 

Michel Soares Tartas	- https://github.com/micheltartas

Developed using Visual Studio Code
20/11/2021 - This Programm is CC-BY license, feel free to use and modify as you want! :D

Desenvolver um programa em C/C++(STL) para manter uma LISTA (Ciclica) de contatos
onde cada contato deve ter as seguintes informações:

nome 	 - string
telefone - string
email 	 - string


O programa deve exibir ao usuário um menu com as opções para:

Incluir um Contato
Remover um Contato (critério de remoção fica a cargo do desenvolvedor)
Navegar todos os Contatos, em ordem normal e reversa.
Pesquisar um Contato pelo telefone
Sair do Programa


************************************************************************/
 
#include <iostream>
#include <string>

using namespace std;

#define ARRAY_SIZE 3

typedef struct {
	string nome;
	string telefone;
	string email;
} Contatos;

void displayMenu();
bool verifyFullList(int index);
bool verifyEmptyStack(int index);
void displayList(Contatos listaDeContatos[], int index);
int listInsert(Contatos listaDeContatos[], int index);
int listRemove(Contatos listaDeContatos[], int index);
void listSearch(Contatos listaDecontatos[], int index);

int main (){
	int index = 0;
	int menuOption = -1;
	Contatos listaDeContatos[ARRAY_SIZE];
	
	do{
		displayMenu();
		scanf("%d", &menuOption);

		switch (menuOption)	{
			case  1 : index = listInsert(listaDeContatos, index);	break; //printf("teste: Indice atual: %d \n", index);	break;
			case  2 : displayList(listaDeContatos, index);			break;
			case  3 : index = listRemove(listaDeContatos, index);	break;
			case  4 : listSearch(listaDeContatos, index);			break;
			default : break;
		}

	} while(menuOption != 5);

	return (0);
}

void displayMenu(){
	printf(
		"-----------------------------------\n"
		"----- Cadastro de Passaportes -----\n"
		"--------------  Menu --------------\n"
		"> 1 - Incluir um Contato          -\n"
		"> 2 - Listar  os Contatos         -\n"
		"> 3 - Remover um Contato          -\n"
		"> 4 - Buscar  um Contato          -\n"
		"> 5 - Sair do Programa            -\n"
		"-----------------------------------\n"
	);
}

int listInsert(Contatos listaDeContatos[], int index){
	
	if(verifyFullList(index) == false){
		cout << "Digite o Nome: \n";
		cin  >> listaDeContatos[index].nome;
		cout << "Digite o Telefone: \n";
		cin  >> listaDeContatos[index].telefone;
		cout << "Digite o E-mail: \n";
		cin  >> listaDeContatos[index].email;
		return (index+1);
	} else {
		return (index);
	}
}

int listRemove(Contatos listaDeContatos[], int index){
	if (verifyEmptyStack(index) == false){
		
		string telefoneBuscado;
		cout << "Digite o telefone do contato a ser Removido!\n";
		cin  >> telefoneBuscado;

		for(int i = 0; i < index ; i++){
			if(listaDeContatos[i].telefone == telefoneBuscado){
				cout << "Nome: " << listaDeContatos[i].nome << " Telefone: " << listaDeContatos[i].telefone << " E-mail: " << listaDeContatos[i].email << "\n";
				index--;

				if(i+1 >= ARRAY_SIZE){
					cout << "Removido com Sucesso!\n";
					return(index);
				}
				listaDeContatos[i] = listaDeContatos[i+1];
			}
		}
		cout << "Elemento nao encontrado! Verifique se o numero esta correto e tente novamente!\n";
		return(index);
	} else {
		return (index);
	}
}

void listSearch(Contatos listaDecontatos[], int index){
	if(verifyEmptyStack(index) == false){
		string telefoneBuscado;
		bool elementoEncontrato = false;
		
		cout << "Digite o telefone do contato desejado!\n";
		cin  >> telefoneBuscado;

		for(int i = 0; i < index ; i++){
			if(listaDecontatos[i].telefone == telefoneBuscado){
				cout << "Nome: " << listaDecontatos[i].nome << " Telefone: " << listaDecontatos[i].telefone << " E-mail: " << listaDecontatos[i].email << "\n";
				elementoEncontrato = true;
			}
		}

		if (elementoEncontrato == false) {
			cout << "Verifique se o telefone buscado esta correto e tente novamente!\n";
		}
	}
}

bool verifyFullList(int index){
	if(index >= ARRAY_SIZE){
		printf("> A Fila esta cheia! Remova elementos primeiro!\n");
		return (true);
	} else {
		return (false);
	}
}

bool verifyEmptyStack(int index){
	if (index == 0){
		printf("> A Fila esta vazia! Adicione elementos primeiro!\n");
		return (true);
	} else {
		return (false);
	}
}

void displayList(Contatos listaDeContatos[], int index){
	
	if (verifyEmptyStack(index) == false){
		for(int i = 0; i < index ; i++){
			cout <<"Nome: " << listaDeContatos[i].nome << "\n";
			cout <<"Telefone: " << listaDeContatos[i].telefone << "\n";
			cout <<"E-mail: " << listaDeContatos[i].email << "\n \n";
		}
	}
}