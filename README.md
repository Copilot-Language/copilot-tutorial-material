# Runtime Verification of Hard Realtime Systems with Copilot: A Tutorial

This repository is part of `Runtime Verification of Hard Realtime Systems with
Copilot: A Tutorial`, at Formal Methods 2024, September 9 2024. It contains a
set of exercises that is used during the session, together with a `Dockerfile`
for quickly getting a working Copilot installation.


## Overview

This repository contains a number of files and directories:

```
.
├── Dockerfile
├── INSTALL.md
├── Makefile
├── README.md
├── answers
├── bin
│   └── rundocker
└── exercises
    ├── ...
    └── test
        ├── Main.hs
        └── run.sh
```

The interesting files are:

- `Dockerfile`: defines the Docker image that we will be using.
- `Makefile`: helps us build the Docker image.
- `answers/`: The answers to the exercises.
- `bin/rundocker`: A wrapper script for running things inside Docker.
- `exercises/`: Directory containing exercises. Each exercise has its own
  subdirectory and a `run.sh` script for running it. `test` is not an exercise,
  but just a simple way to test your installation.


## Requirements & Setup

Please see `INSTALL.md` for installation.


## Running the exercises

Each exercise comes with its own file. There are two ways to run them, either
by passing `bin/rundocker runhaskell` followed by the file to run:

```sh
$ bin/rundocker runhaskell exercises/Ex??-??.hs
```

Or, passing no arguments to open up a terminal inside the container in which we
can call `runhaskell`:

```sh
$ bin/rundocker
# cd /exercises/
# runhaskell Ex??-??.hs
```
