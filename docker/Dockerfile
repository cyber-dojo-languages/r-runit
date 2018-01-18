FROM  cyberdojofoundation/rbase:3.4.3
LABEL maintainer=jon@jaggersoft.com

RUN apt-get update && apt-get install --yes wget

COPY install_RUnit.R /
RUN cd / && Rscript install_RUnit.R

COPY red_amber_green.rb /usr/local/bin
