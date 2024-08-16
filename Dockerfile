FROM debian:testing

RUN apt-get update

# Install Copilot from the Debian repositories.
RUN apt-get install --yes libghc-copilot-dev

# Install solver we will use with copilot-theorem.
RUN apt-get install --yes z3
