# PAM Cracklib (No Dictionary Check)
The vanilla pam_cracklib module with dictionary checks disabled.

## Overview
This is just the `pam_cracklib` module with the dictionary check diabled. This levels the playing field for testing against the verified implementation which does not have a dictionary check built in.

## Building
To build the module, use:

```bash
make
```

There are prerequisites for building this module on your system, so it's best to build it on [the Vagrant box created specifically for this purpose](https://github.com/sr-lab/verified-pam-environment).

## Installation
To install the module (that is, get is ready to use) use:

```bash
make install
```

Note that this will *not* make this your active module! To set the module as active (that is, add it to your PAM configuration) use:

```bash
make activate
```

And to switch back to the default module `pam_cracklib.so` use:

```bash
make deactivate
```

## Future Work
It may be possible to replicate the full functionality of the module (including dictionary check) by using something like [Coq.io](http://coq.io) to read the same format of configuration string and dictionary file that pam_cracklib does.
