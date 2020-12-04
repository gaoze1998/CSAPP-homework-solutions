void show_bytes(unsigned char *p, unsigned n) {
    unsigned char hexes[n];
    for(int i = 0; i < n; i++) {
        hexes[n - i - 1] = p[i];
    }
    for(int i = 0; i < n; i++) {
        printf("%x ", hexes[i]);
    }
    printf("\n");
}