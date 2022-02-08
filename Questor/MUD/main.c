#include <stdio.h>
#include <stdlib.h>

/* run this program using the console pauser or add your own getch, system("pause") or input loop */

struct Player{
	int forca, destreza, inteligencia, vitalidade, classe, localAtual;
};


void opening();
struct Player classSelection();
struct Player statusDoJogador(struct Player player);
void gameState(struct Player player);
void exitGame();
char getInput();
char temploInicial();
char patio();

int main(int argc, char *argv[]) {
	
	struct Player player;
	
	opening();
	player = classSelection();
	statusDoJogador(player);
	
	gameState(player);
	
	return (0);
}

void opening(){
	printf(
		"***********************************\n"
		"* Welcome to Medieval Adventurer! *\n"
		"***********************************\n"
		"\n"
	);
}

struct Player classSelection(){
	
	int classe = 0;
	struct Player player;
	
	while(classe != 1 && classe != 2 && classe != 3){
		
		printf(
			"-----------------------------------------------------\n"
			"Choose your Character Classes!\n"
			"1 - Rogue - A Master of Stealth and use of daggers!\n"
			"2 - Fighter - A Powerful Weapon Master!\n"
			"3 - Wizard - A Relentless Wizard!\n"
			"\n"
			"Press the correct key and press Enter!\n"
			"-----------------------------------------------------\n"
		);

		scanf("%d", &classe);
		
		switch(classe){
			case 1 	: printf("\nNow, you a Rogue a Master of Stealth\n");	 player.forca = 7; player.destreza = 10; player.inteligencia = 7; player.vitalidade = 15;	break;
			case 2 	: printf("\nNow, you a Fighter a Weapom Master\n");	 player.forca = 10; player.destreza = 5; player.inteligencia = 5; player.vitalidade = 20;		break;
			case 3 	: printf("\nNow, you a Wizard a Relentless Wizard\n"); player.forca = 5; player.destreza = 5; player.inteligencia = 10; player.vitalidade = 10;		break;
			default : printf("\nPlease, select a existing Class!\n");																									break;	
		}
	}
	player.localAtual = 0;	
	
	return (player);
}

struct Player statusDoJogador(struct Player player){
	
	printf(
		"\n"
		"**********************\n"
		"*    Player Status   *\n"
		"*                    *\n"
		"* Strength:      %d  *\n* Dexterity:    %d  *\n* Intelligence:  %d  *\n* Vitality:     %d  *\n", player.forca, player.destreza, player.inteligencia, player.vitalidade
	);
	printf("********************\n\n");
	
}

char getInput(){
	
	char opcao = -1;
		
	printf(
		"\n"
		"=> What do you want to do?\n"
		"\n"
		"> Avaiable Options:\n> 0 - Exit Game\nE - Go to East\tN - Go to North\tW - Go to West\tS - Go to South\tL - Look Around\n"
	);
	//opcao = getchar();
	//getchar();
	scanf("%s", &opcao);
	fflush(stdin);
	return (opcao);
}

void gameState(struct Player player){
	
	player.localAtual = temploInicial();
	
	do {
		switch(player.localAtual){
			case 0 : exitGame();					break;
			case 2 : player.localAtual = patio(); 	break;
		}
	} while (player.localAtual != 0);
}

char temploInicial(){
	
	char opcao = -1;
	
	printf(
		"\n"
		"Description:\n"
		"> Your journey starts at a Temple dedicated to Caadrus God.\n"
		"> Caadrus, the god of Knowledge.\n"
		"> This temple has large stained glass windows with beautiful drawings\n"
		"> dedicated to the god of knowledge, his work and his followers.\n"
		"> There is a door, leading to the South, a door to the coutyard!\n"
	);
	
	while (opcao != 's' && opcao != 'S' && opcao != '0') {
		//printf("\nteste\n");
		opcao = getInput();
		if (opcao != 's' && opcao != 'S' && opcao != '0') {
			printf("\nInvalid Option! Please, choose a valid Option!\n");
		}
	}
	
	if (opcao == 's' || opcao == 'S') {
		return (2);
	} else {
		return (0);
	}
}

char patio(){
	
	char opcao = -1;
	
	printf(
		"\n"
		"You are in the Courtyard!\n"
	);
	
	do {
		opcao = getInput();
		if (opcao != 's' && opcao != 'S' && opcao != '0') {
			printf("\nInvalid Option! Please, choose a valid Option!\n");
		}
	} while(opcao != 's' && opcao != 'S' && opcao != '0');
	
	if (opcao == 's' || opcao == 'S') {
		return (2);
	} else {
		return (0);
	}
}

void exitGame(){
	printf(
		"\n"
		"******************************\n"
		"*   Good Bye! Until Next!   :D\n"
		"******************************\n"
		"\n"
	);
}
