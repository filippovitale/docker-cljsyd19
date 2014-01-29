FROM filippovitale/java7
MAINTAINER Filippo Vitale @filippovitale

RUN apt-get -qy install curl
RUN curl https://raw.github.com/technomancy/leiningen/stable/bin/lein > /usr/local/bin/lein
RUN chmod +x /usr/local/bin/lein

ENV LEIN_ROOT 1
RUN lein upgrade

ADD zookeeper-clj /cljsyd19
RUN cd /cljsyd19 && echo "(exit)" | lein repl

WORKDIR /cljsyd19
CMD lein run
