#!/bin/bash
# list of supported domains
domains="wikitolearn.org direct.wikitolearn.org wikitolearn.vodka tuttorotto.biz tuttorotto.eu tuttorotto.org tuttorotto.it"
# list of supported subdomain
langs="de pt sv meta fr pool it es en"
{
 echo "'use strict';"

 echo "exports.setup = function(parsoidConfig) {"
 for domain in $domains ; do
  for lang in $langs ; do
   echo " parsoidConfig.setMwApi({ domain: '$lang.$domain', uri: 'http://$lang.$domain/api.php' });"
  done
 done
 echo " parsoidConfig.loadWMF = false;"
 echo " parsoidConfig.useSelser = true;"
 echo "};"
} > localsettings.js
