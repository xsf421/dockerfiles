FROM ubuntu:latest

# install dependencies

RUN apt-get update -y
RUN apt install wget -y
RUN apt install unzip -y
RUN apt install default-jre -y

# download and unzip headshotbox

RUN wget https://github.com/bugdone/headshotbox/releases/download/0.17.0/headshotbox-0.17.0-linux.zip
RUN unzip headshotbox-0.17.0-linux.zip

# open container port 4000

EXPOSE 4000

# mark files as executable

RUN chmod -x /headshotbox-0.17.0-linux/hsbox-0.17.0-standalone.jar

# run hsbox 

CMD ["java", "-jar", "/headshotbox-0.17.0-linux/hsbox-0.17.0-standalone.jar"]
