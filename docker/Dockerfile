FROM  cyberdojofoundation/rbase:3.3.2
LABEL maintainer=jon@jaggersoft.com

RUN apt-get update
RUN apt-get install --yes wget

COPY install_RUnit.R /
RUN cd / && Rscript install_RUnit.R

COPY red_amber_green.rb /usr/local/bin
