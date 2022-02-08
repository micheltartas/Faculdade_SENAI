/****************************************************************************************
Michel Soares Tartas	- https://github.com/micheltartas

Developed using Visual Studio Code
22/11/2021 - This Programm is CC-BY license, feel free to use and modify as you want! :D

Desenvolver um programa em Linguagem C/C++(STL), utilizando uma estrutura de dados tipo Queue,
para uma empresa de transporte aéreo, o qual servirá para implementar funções de controle da lista dos voos.
A estrutura deve ser implementada com alocação dinâmica memória e deve conter os seguintes dados:

número do voo;
aeroporto de Saída;
aeroporto de Chegada;
tempo estimado de voo;
passageiros a bordo;
Para a entrega, deixar todo o código/arquivos desenvolvidos dentro de um único arquivo .zip, na primeira linha do código escrever seu nome com comentário.

******************************************************************************************/
#include <iostream>
#include <stdlib.h>
#include <string>
using namespace std;

typedef struct Nodo{
	int numVoo;
    string aeroportoSaida;
    string aeroportoChegada;
    string tempoEstimado;
    int passageirosAbordo;
	struct Nodo *pNext;
} Nodo;

typedef struct Queue{
    struct Nodo *pFirst;
    struct Nodo *pLast;
} Queue;

Nodo *aux;

void showMenu();
Queue* createQueue();
void queueInsert(Queue *pQueue);
void queueShow(Queue *pQueue);
void queueRemove(Queue *pQueue);

int main(){
    
    int menuOption = -1;

    Queue *pQueue = createQueue();

    while(menuOption != 4){
        showMenu();
        cin >> menuOption;

        switch(menuOption){
            case  1 : queueInsert(pQueue);	break;
            case  2 : queueShow(pQueue);	break;
            case  3 : queueRemove(pQueue);	break;
            case  4 :                   	break;
            default :                   	break;    
        }
    }

    return (0);
}

void showMenu(){
	cout <<
		"\n"
		"-----------------------------------\n"
		"--------- Transporte Aereo --------\n"
		"--------------  Menu --------------\n"
		"> 1 - Inserir um Cadastro         -\n"
		"> 2 - Listar  um Cadastro         -\n"
		"> 3 - Remover um Cadastro         -\n"
		"> 4 - Sair do Programa            -\n"
		"-----------------------------------\n"
	;
}

Queue* createQueue(){
    Queue* pQueue = (Queue*) malloc(sizeof(Queue));
    if(pQueue != NULL){
        pQueue->pLast = NULL;
        pQueue->pFirst = NULL;
    }
    return pQueue;
}

void queueInsert(Queue *pQueue){
	Nodo*novo =(Nodo*) malloc(sizeof(Nodo));
    
	printf("Digite o numero do Voo a ser inserido na Queue: ");
	scanf("%d",&novo->numVoo);
/*
    printf("Digite o Aeroporto de Saida: ");
    scanf("%s",&novo->aeroportoSaida);

    printf("Digite o Aeroporto de Chegada: ");
    scanf("%s",&novo->aeroportoChegada);

    printf("Digite o Tempo Estimado de voo: ");
    scanf("%s",&novo->tempoEstimado);

    printf("Digite quantidade de Passageiros a Bordo do voo: ");
    scanf("%s",&novo->passageirosAbordo);
*/
	novo->pNext = NULL;
	if(pQueue->pFirst == NULL){
		pQueue->pFirst = novo;
		pQueue->pLast = novo;
	}else{
		pQueue->pLast->pNext = novo;
		pQueue->pLast = novo;
	}
	printf("\nCadastro inserido na Queue!");
}

void queueShow(Queue *pQueue){
	if(pQueue->pFirst == NULL){
		printf("\nQueue Vazia!!\n");
	}else{
		aux = pQueue->pFirst;
		do{
			printf("Voo: %d \n", aux->numVoo);
            //cout << "Aeroporto de Saida: "<< aux->aeroportoSaida << "\n";
            //printf("Aeroporto de Saida: %s \n", aux->aeroportoSaida.c_str());
            //printf("Aeroporto de Chegada: %s \n", aux->aeroportoChegada);
            //printf("Tempo estimado de Voo: %s \n", aux->tempoEstimado);
            //printf("Passageiros do VOO: %d \n", aux->passageirosAbordo);
			aux = aux->pNext;
		} while(aux != NULL);
	}
}

void queueRemove(Queue *pQueue){
	if(pQueue->pFirst == NULL){
		printf("\nQueue Vazia!!\n");
	}else{
		aux = pQueue->pFirst;
		printf("%d removido!", pQueue->pFirst->numVoo);
		pQueue->pFirst = pQueue->pFirst->pNext;
		free(aux);
	}
}