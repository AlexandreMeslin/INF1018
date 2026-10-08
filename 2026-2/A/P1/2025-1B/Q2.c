/*
Implemente uma função em C chamada contaBitsZero que 
recebe um inteiro de quatro bytes sem
sinal chamado numero e retorna a quantidade de bits em “0” 
em sequência a partir do bit menos significativo.
Considere que o bit menos significativo é o bit de 
posição “0”. Use o seguinte protótipo:
int contaBitsZero(unsigned int numero);
*/

int contaBitsZero(unsigned int numero) {
    int contador = 0;
    // sizeof numero ==> quantidade de bytes
    // (sizeof numero)*8 ==> quantidade de bits
    while((numero & 1 == 0) && (contador < (sizeof numero)*8)) {
        contador++;
        numero = numero >> 1;
    }
    return contador;
}