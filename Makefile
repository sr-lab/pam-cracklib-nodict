SHELL:=/bin/bash

main:
	gcc -fPIC -c pam_cracklib_nodict.c
	gcc -shared -o pam_cracklib_nodict.so pam_cracklib_nodict.o -lpam

install:
	# Delete existing installation and copy built installation over
	rm -f /lib/x86_64-linux-gnu/security/pam_cracklib_nodict.so
	yes | cp -f ./pam_cracklib_nodict.so /lib/x86_64-linux-gnu/security
	rm -f /lib/security/pam_cracklib_nodict.so
	yes | cp -f ./pam_cracklib_nodict.so /lib/security

activate:
	# Switch to use module with dictionary check disabled
	sed -i -e's/pam_cracklib\.so/pam_cracklib_nodict\.so/g' /etc/pam.d/common-password

deactivate:
	# Switch back to default module
	sed -i -e's/pam_cracklib_nodict\.so/pam_cracklib\.so/g' /etc/pam.d/common-password
