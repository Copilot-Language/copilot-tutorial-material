FROM debian:testing

RUN apt-get update

# Install Copilot from the Debian repositories.
RUN apt-get install --yes libghc-copilot-dev
