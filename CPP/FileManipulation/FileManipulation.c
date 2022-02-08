/* Michel Soares Tartas	- https://github.com/micheltartas

Developed using Dev-C++
13/11/2021 - This Programm is CC-BY license, feel free to use and modify as you want! :D

Desenvolver um programa que fa�a a leitura de um arquivo tipo texto,
ordene (crescente) os dados contidos nesse arquivo, 
e ap�s a ordena��o salve o resultado em um arquivo do tipo texto diferente do primeiro
e fa�a uma c�pia do ultimo em formato bin�rio. 

Para que o programa funcione corretamente, deve-se criar um arquivo chamado entrada.txt
no mesmo diretorio que o FileManipulation.c esta, o texto que sera ordenado deve ser
escrito dentro do entrada.txt

Ao executar o programa será criado um arquivo saida.txt e saidaBinaria.bin estes sao
os arquivos com as saidas ordenadas e escritas em binario.

Qualquer duvida entre em contato pelo GitHub! :D */

#include <stdio.h>
#include <string.h>

#define TAMANHO 50  //Define o tamanho do Texto. Cuidado: Textos maiores ou menores que o definido aqui podem causar erros.

int main(){
    
	FILE * fArquivoEntrada;
	FILE * fArquivoSaida;
    FILE * fArquivoSaidaBinario;

    char bubble[TAMANHO], buffer[TAMANHO], c;
    char temp;
    int inner,outer,x;

    fArquivoEntrada = fopen("entrada.txt", "r");
    fArquivoSaida = fopen("saida.txt", "w");
    fArquivoSaidaBinario = fopen("saidaBinaria.bin", "w+b");
    
    printf("---- Texto Presente no Arquivo ----\n");
    fgets(buffer, TAMANHO, fArquivoEntrada);
    printf("%s\n", buffer);
	
    /* Faz uma copia do conteúdo do arquivo para realizar a Bubble Sort */
	strncpy(bubble, buffer, TAMANHO);
	
    /* Mostra o Texto que foi pego no Buffer */
    puts("\n---- Texto Original ----");
    for(x=0;x<TAMANHO;x++)
        printf("%c",bubble[x]);
    putchar('\n');

    /* Faz a Bubble Sort */
    for(outer = 0;outer < TAMANHO-1; outer++) {
        for(inner = outer+1; inner < TAMANHO; inner++) {
            if(bubble[outer] > bubble[inner]) {
                temp = bubble[outer];
                bubble[outer] = bubble[inner];
                bubble[inner] = temp;
            }
        }
    }
    /* Escreve no Arquivo de Saída */
    fwrite(bubble, sizeof(char), TAMANHO, fArquivoSaida); 

    /* Escreve no Arquivo de Saída Binario */  
    fwrite(&bubble, sizeof(char), TAMANHO, fArquivoSaidaBinario); 

    /* Mostrar Texto Ordenado */
    puts("\n---- Texto Ordenado -----:");
    for(x = 0; x < TAMANHO; x++)
        printf("%c",bubble[x]);
    putchar('\n');
    
    /* Fecha os Arquivos e Finaliza o Programa*/
    fclose(fArquivoEntrada);
	fclose(fArquivoSaida);
    fclose(fArquivoSaidaBinario);
    return(0);
}
