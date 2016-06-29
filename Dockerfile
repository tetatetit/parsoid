FROM node:5
ADD ./sources.list /etc/apt/sources.list

RUN git clone https://gerrit.wikimedia.org/r/p/mediawiki/services/parsoid && cd parsoid && git checkout v0.5.1 && rm -Rf .git/

WORKDIR parsoid

RUN npm install && rm -Rf /tmp/npm-* /root/.npm/

EXPOSE 8000

ADD ./kickstart.sh /
RUN chmod +x /kickstart.sh
CMD /kickstart.sh
