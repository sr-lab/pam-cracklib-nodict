SHELL:=/bin/bash

main:
	gcc -fPIC -c pam_cracklib.c
	gcc -shared -o pam_cracklib.so pam_cracklib.o -lpam
