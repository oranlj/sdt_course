#include <stdio.h>

int main(void) {
    FILE *fp = fopen("sample.txt", "r");
    if (fp == NULL) {
        perror("fopen");
        return 1;
    }
    char line[128];
    if (fgets(line, sizeof line, fp)) printf("read: %s", line);
    fclose(fp);
    return 0;
}
