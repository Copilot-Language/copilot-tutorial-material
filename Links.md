# Connections to other tools and real systems.

- (ROS, cFS, F'); Ogma

https://github.com/nasa/ogma

# Open problems

## Arduino

- https://hackage.haskell.org/package/arduino-copilot

## Rust and other backends.

- https://github.com/Copilot-Language/copilot-rust
- https://github.com/Copilot-Language/copilot-rust/discussions

## New logics

CTL, LTL, multi-valued LTL, others

## Efficiency and performance (including FPGA)

We have an FPGA backend. The backend relies on the bluespec language, which is
used in industrial development of FPGAs.

Do we have a measure that the result is minimal?

## Clocks

- Currently, all streams advance in lockstep. What if you want to advance them
  at different rates?

## Types

https://github.com/Copilot-Language/copilot/blob/master/copilot/examples/Array.hs
https://github.com/Copilot-Language/copilot/blob/master/copilot/examples/Structs.hs#L14-L18
https://github.com/Copilot-Language/copilot/blob/master/copilot/examples/Structs.hs#L58-L60

How to use other types.

## User interface and simulation

https://www.tessla.io/

## Monitoring of distributed system or multi-level RV

- How to install properties and how to instrument a distributed system.

## We want users from outside

- If you use it, and it helps you, let us know.
agoodloe@nasa.gov; ivan.perezdominguez@nasa.gov

- If you create work based on it, also let us know.
agoodloe@nasa.gov; ivan.perezdominguez@nasa.gov

- If you want to collaborate, please reach out:
agoodloe@nasa.gov; ivan.perezdominguez@nasa.gov

- If you use it and something fails, create a ticket:
https://github.com/Copilot-Language/copilot

- Whatever you choose, get involved:
https://github.com/Copilot-Language/copilot/discussions
