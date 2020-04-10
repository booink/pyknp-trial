FROM python:3.7-slim

# create user as "app"
#RUN useradd --user-group --create-home --shell /bin/false app

# set home directory
ENV HOME=/app
WORKDIR /app

# copy source file
COPY . .

# install dependencies
RUN apt-get update && apt-get install -y \
  build-essential \
  curl \
  bzip2 \
  libjuman \
  libcdb-dev \
  zlib1g-dev
RUN pip install --requirement requirements.txt

# install juman and KNP and copy .jumanrc file
RUN mkdir src && \
  cd src && \
  curl -L -o juman-7.01.tar.bz2 http://nlp.ist.i.kyoto-u.ac.jp/nl-resource/juman/juman-7.01.tar.bz2 && \
  tar xf juman-7.01.tar.bz2 && \
  cd juman-7.01 && \
  ./configure && \
  make && \
  make install && \
  cp /usr/local/etc/jumanrc .jumanrc
RUN cd src && \
  curl -L -o knp-4.19.tar.bz2 http://nlp.ist.i.kyoto-u.ac.jp/nl-resource/knp/knp-4.19.tar.bz2 && \
  tar xf knp-4.19.tar.bz2 && \
  cd knp-4.19 && \
  ./configure && \
  make && \
  make install

# delete download cache
RUN rm -rf src && \
  apt-get purge -y \
  build-essential \
  curl \
  bzip2

# change user
#RUN chown -R app:app $HOME/*
#USER app

# set CMD
#CMD ["python3", "pyknp_test.py"]
