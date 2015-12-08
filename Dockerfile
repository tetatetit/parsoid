FROM node:5
RUN git clone https://gerrit.wikimedia.org/r/p/mediawiki/services/parsoid && cd parsoid && git checkout v0.4.1 && rm -Rfv .git/

WORKDIR parsoid

RUN npm install

EXPOSE 8000

ADD ./localsettings.js /parsoid/api/

ADD ./kickstart.sh /
RUN chmod +x /kickstart.sh
CMD /kickstart.sh
