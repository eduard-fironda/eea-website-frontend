#!/bin/sh
ES_URL="http://search:60168"
QA_URL="http://search:60022"
env \
  DEBUG=esmiddleware \
  RAZZLE_PROXY_ES_DSN_datahub=$ES_URL/data_searchui_datahub \
  RAZZLE_PROXY_ES_DSN_globalsearch=$ES_URL/data_searchui \
  RAZZLE_PROXY_QA_DSN_globalsearch=$QA_URL/api \
  yarn start
