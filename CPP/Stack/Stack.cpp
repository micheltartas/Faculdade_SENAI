/***************************************************************************************************************** 

Michel Soares Tartas	- https://github.com/micheltartas

Developed using Visual Studio Code
16/11/2021 - This Programm is CC-BY license, feel free to use and modify as you want! :D


Desenvolver um programa em C/C++ (STL) para manter uma PILHA de temas para livros.
Cada  tema deve ter as seguintes informações:

nome - string
descricao - string
Desenvolver o código usando uma estrutura, em forma de PILHA, para representar um tema com os campos solicitados.
O programa deve exibir ao usuário um menu com as opções para: 



Incluir um Tema
Remover um Tema
Listar os Tema ainda na Pilha
Sair do Programa

****************************************************************************************************************/
#include <iostream>
#include <string>

using namespace std;

#define STRING_SIZE 50
#define ARRAY_SIZE 5

typedef struct {
	int index;
	string nome[STRING_SIZE];
	string descricao[STRING_SIZE];
} Themes;

void displayMenu();
bool verifyEmptyStack(Themes theme[]);
bool verifyFullStack(Themes theme[]);
void displayStack(Themes theme[]);
void pushStack(Themes theme[]);
void popStack(Themes theme[]);

int main (){

	int i;
	int menuOption = -1;
	Themes theme[ARRAY_SIZE];
	theme->index = 0;
	
	do{
		displayMenu();
		scanf("%d", &menuOption);

		switch (menuOption)	{
			case  1 : pushStack(theme);		break;
			case  2 : popStack(theme);		break;
			case  3 : displayStack(theme); 	break;
			default : break;
		}
		
	} while(menuOption != 4);

	return (0);
}

void displayMenu(){
	printf(
		"--------------  Menu --------------\n"
		"> 1 - Incluir um Tema\n"
		"> 2 - Remover um Tema\n"
		"> 3 - Listar os Tema ainda na Pilha\n"
		"> 4 - Sair do Programa\n"
		"-----------------------------------\n"
	);
}

void pushStack(Themes theme[]){
	if(verifyFullStack(theme) == false){
		printf("Posicao Atual: %d - Digite o Tema a ser inserido!\n", theme->index);
		cin  >> theme->nome[theme->index];
		printf("Digite a descricao!\n");
		cin  >> theme->descricao[theme->index];
		theme->index++;
	}
}

void popStack(Themes theme[]){
	if(verifyEmptyStack(theme) == false){
		theme->index--;
		printf("Removido com sucesso!\n");
	}
}

bool verifyEmptyStack(Themes theme[]){
	if (theme->index == 0){
		printf("> A pilha esta vazia! Adicione elementos primeiro!\n");
		return (true);
	} else {
		return (false);
	}
}

bool verifyFullStack(Themes theme[]){
	if(theme->index >= ARRAY_SIZE){
		printf("> A pilha esta cheia! Remova elementos primeiro!\n");
		return (true);
	} else {
		return (false);
	}
}

void displayStack(Themes theme[]){
	int i;
	if(verifyEmptyStack(theme) == false) {
		for(i = 0; i < theme->index ; i++){
			if(theme->nome[i].length() != 0){
				cout <<"> Posicao:  " << i << " Tema: " << theme->nome[i] + "\n";
				cout <<"> Descricao: " << theme->descricao[i] + "\n \n";
			}
		}
	}
}