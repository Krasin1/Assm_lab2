#include <stdio.h>
#include <stdlib.h>

short res_short;
unsigned short res_ushort;

extern void asm_short(short a, short b);
extern void asm_ushort(unsigned short a, unsigned short b);

void vvod_short(short * a, short * b) {
    puts("Введите a, b");
    scanf("%hd", a);
    scanf("%hd", b);
}

void f_short() {
    short a, b;
    puts("      short      ");
    puts("Диапозон данных : -32,767 до 32,767");
    vvod_short(&a, &b);
    asm_short(a, b);
    printf("Результат = %hd\n", res_short); 
}

void vvod_ushort(unsigned short * a, unsigned short * b) {
    puts("Введите a, b");
    scanf("%hu", a);
    scanf("%hu", b);
}
void f_ushort() {
    unsigned short a, b;
    puts("      unsigned short      ");
    puts("Диапозон данных : 0 до 65,535");
    vvod_ushort(&a, &b);
    asm_ushort(a, b);
    printf("Результат = %hu\n", res_ushort); 
}

void choose(short a) {
    if (a == 1) { f_short(); }
    else if (a == 2) { f_ushort(); }
    else { puts("Нет такого выбора"); }
}

int main() {
    short a;
    puts("Выберите тип данных(1 - short ; 2 - unsigned short)");
    if(1 != scanf("%hd", &a)) {
        puts("Error!");
    }
    choose(a);    
    return 0;
}
