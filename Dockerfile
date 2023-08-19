FROM nvidia/cuda:11.6.2-devel-ubuntu20.04
LABEL maintainer="motahar.mahtab@gigatechltd.com"

# Upgrade installed packages
RUN apt update && apt upgrade -y && apt clean

ENV TZ=Europe/Minsk
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# install python 3.8.10 (or newer)
RUN apt update && \
    apt-get install -y tzdata && \
    apt install --no-install-recommends -y build-essential software-properties-common && \
    add-apt-repository -y ppa:deadsnakes/ppa && \
    apt install --no-install-recommends -y python3.8 python3.8-dev python3.8-distutils && \
    apt clean && rm -rf /var/lib/apt/lists/*


# install python 3.8.10 (or newer)
# RUN update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.8.0

RUN apt-get -y update && \
    apt-get -y install && \
    apt-get -y install build-essential

RUN apt-get -y install python3-pip
RUN python3 -m pip install --upgrade pip

RUN apt-get -y install git

WORKDIR /service
COPY . /service/

RUN pip install --upgrade pip
RUN pip install --no-cache-dir -r requirements.txt
EXPOSE 8000