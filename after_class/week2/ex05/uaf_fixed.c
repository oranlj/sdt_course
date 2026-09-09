#include <stdlib.h>
#include <string.h>
#include <stdio.h>

int main(void) {
    char *greeting = malloc(32);
    if (greeting == NULL) return 1;
    strcpy(greeting, "Hello, world!");
    greeting[0] = 'J';
    printf("%s\n", greeting);
    free(greeting);
    greeting = NULL;
    return 0;
}
