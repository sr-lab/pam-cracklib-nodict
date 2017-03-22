SHELL:=/bin/bash

main:
	gcc -fPIC -c pam_cracklib_nodict.c
	gcc -shared -o pam_cracklib_nodict.so pam_cracklib_nodict.o -lpam
