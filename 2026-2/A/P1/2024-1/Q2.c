/*
Implemente uma fun¸c˜ao em C, que dado um inteiro sem 
sinal retorne um inteiro sem
sinal onde a ordem dos 4 bytes do parˆametro de entrada 
foi invertida. Use o seguinte prot´otipo:
unsigned int inverteOrdemBytes(unsigned int i);
Por exemplo, se a entrada i for igual a 0x01020304 a 
sa´ıda devera ser 0x04030201.
*/

unsigned int inverteOrdemBytes(unsigned int i) {
    unsigned int byte0 = (i & 0x000000FF) << 24;
    unsigned int byte1 = (i & 0x0000FF00) << 8;
    unsigned int byte2 = (i & 0x00FF0000) >> 8;
    unsigned int byte3 = (i & 0xFF000000) >> 24;
    return byte0 | byte1 | byte2 | byte3;
}
