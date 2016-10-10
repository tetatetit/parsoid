#!/bin/bash
if [[ "$WTL_DOMAIN_NAME" == "" ]]
then
  echo "Missing WTL_DOMAIN"
  exit 1
fi
# list of supported subdomain
langs="ru it en de es fr pt sv ca meta pool"
{
 echo "'use strict';"
 echo "exports.setup = function(parsoidConfig) {"
 echo 'parsoidConfig.userAgent = "WikiToLearn Parsoid";'
 for lang in $langs ; do
   echo " parsoidConfig.setMwApi({ domain: '$lang.$WTL_DOMAIN_NAME', uri: 'http://$lang.$WTL_DOMAIN_NAME/api.php' });"
 done
 echo " parsoidConfig.loadWMF = false;"
 echo " parsoidConfig.useSelser = true;"
 echo "};"
} > /parsoid/localsettings.js

cd /parsoid

exec npm start
