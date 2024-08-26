# Installation

In order to run Copilot and use the exercises in this repository, we need:

1. A POSIX compatible host system, e.g. most Linux or MacOS. Windows probably
   works as well.
2. Have `make` and `docker` installed.
3. Be able to run Docker images, preferably as a normal non-root user.

Once the requirements are met, the provided docker image needs to be build. The
repository provides a `Makefile`. From the root of the repository execute:

```sh
$ make
```

This will build a Debian testing based image containing a Copilot installation,
and run a test to check if it works correctly. If no errors are reported, and
the end of the output should match:

```
test:
(true)
(true)
(true)
(true)
(true)
(true)
(true)
(true)
(true)
(true)
```

## Cleaning up

When after the tutorial the docker image is not necessary anymore, it can
easily be removed from the system with a:

$ make clean
