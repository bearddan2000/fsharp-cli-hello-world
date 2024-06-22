FROM ubuntu:18.04

WORKDIR /workspace

# Install tooling dependencies
RUN apt-get -q update && \
    apt-get -q install -y --no-install-recommends ca-certificates \
        wget

RUN wget https://packages.microsoft.com/config/ubuntu/18.04/packages-microsoft-prod.deb -O packages-microsoft-prod.deb

RUN dpkg -i packages-microsoft-prod.deb && \
    rm packages-microsoft-prod.deb

# Install tooling dependencies
RUN apt-get -q update && \
    apt-get -q install -y --no-install-recommends ca-certificates \
        dotnet-sdk-6.0

WORKDIR /code

COPY bin .

CMD "./run.sh"