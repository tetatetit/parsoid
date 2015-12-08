#!/bin/bash
if [[ "$langs" != "" ]] ; then
 {
  echo "'use strict';"

  echo "exports.setup = function(parsoidConfig) {"
  for lang in $langs ; do
  echo " parsoidConfig.setMwApi({ prefix: '${lang}wikitolearn', uri: 'http://$lang.wikitolearn.org/api.php' });"
  done
  echo " parsoidConfig.loadWMF = false;"
  echo " parsoidConfig.useSelser = true;"
  echo "};"
 } > /parsoid/api/settings.js
fi
node api/server.js
