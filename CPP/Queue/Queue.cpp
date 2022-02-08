/***************************************************************************************************************** 

Michel Soares Tartas	- https://github.com/micheltartas

Developed using Visual Studio Code
20/11/2021 - This Programm is CC-BY license, feel free to use and modify as you want! :D

Desenvolver um programa em C/C++(STL) que carregue uma estrutura de dados tipo FILA Ordenada
(a forma e critério de ordenação fica a cargo do desenvolvedor) contendo:

Nome;
CPF;
Passaporte.

O código deve exibir um menu com as opções:

Inserir um cadastro
Listar todo o cadastro
Remover um cadastro

****************************************************************************************************************/
#include <iostream>
#include <string>

using namespace std;

#define ARRAY_SIZE 3

typedef struct {
	string nome;
	string cpf;
	string passaporte;
} PassPort;

void displayMenu();
bool verifyFullList(int index);
bool verifyEmptyStack(int index);
void displayList(PassPort passports[], int index);
int listInsert(PassPort passports[], int index);
int listRemove(PassPort passports[], int index);

int main (){
	int index = 0;
	int menuOption = -1;
	PassPort passports[ARRAY_SIZE];
	
	do{
		displayMenu();
		scanf("%d", &menuOption);

		switch (menuOption)	{
			case  1 : index = listInsert(passports, index);	break; //printf("teste: Indice atual: %d \n", index);	break;
			case  2 : displayList(passports, index);		break;
			case  3 : index = listRemove(passports, index);	break;
			default : break;
		}

	} while(menuOption != 4);

	return (0);
}

void displayMenu(){
	printf(
		"-----------------------------------\n"
		"----- Cadastro de Passaportes -----\n"
		"--------------  Menu --------------\n"
		"> 1 - Inserir um Cadastro         -\n"
		"> 2 - Listar  um Cadastro         -\n"
		"> 3 - Remover um Cadastro         -\n"
		"> 4 - Sair do Programa            -\n"
		"-----------------------------------\n"
	);
}

int listInsert(PassPort passports[], int index){
	
	if(verifyFullList(index) == false){
		cout << "Digite o Nome: \n";
		cin  >> passports[index].nome;
		cout << "Digite o CPF: \n";
		cin  >> passports[index].cpf;
		cout << "Digite o Passaporte: \n";
		cin  >> passports[index].passaporte;
		return (index+1);
	} else {
		return (index);
	}
}

int listRemove(PassPort passports[], int index){
	if (verifyEmptyStack(index) == false){
		int i;
		for(i = 0; i < index ; i++){
			if(i+1 >= ARRAY_SIZE){
				cout << "Primeiro Elemento, removido com Sucesso!\n";
				return (index-1);
			}
			passports[i] = passports[i+1];
		}
		cout << "Primeiro Elemento, removido com Sucesso!\n";
		return(index-1);
	} else {
		return (index); 
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

void displayList(PassPort passports[], int index){
	
	if (verifyEmptyStack(index) == false){
		int i;
		for(i = 0; i < index ; i++){
			cout <<"Nome: " << passports[i].nome << "\n";
			cout <<"CPF: " << passports[i].cpf << "\n";
			cout <<"Passaporte: " << passports[i].passaporte << "\n \n";
		}
	}
}