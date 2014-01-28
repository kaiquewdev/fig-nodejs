FROM stackbrew/ubuntu:13.10
RUN apt-get -qq update
RUN apt-get install -y software-properties-common python python-setuptools build-essential wget
RUN wget http://nodejs.org/dist/v0.10.25/node-v0.10.25.tar.gz
RUN tar zxvf node-v0.10.25.tar.gz
WORKDIR /node-v0.10.25
RUN ./configure && make && make install
ADD . /source
WORKDIR /source/app
EXPOSE 3000
RUN npm install
CMD node app.js 
