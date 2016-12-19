#!/bin/bash

if [ "$ENTRYPOINT" = "workers" ]
then
  echo Starting workers
  while :
  do
    ruby -e "puts 'Fake worker running...'"
    sleep 1
  done

elif [ "$ENTRYPOINT" = "admin-ui" ]
then
  echo Starting admin-ui
  while :
  do
    ruby -e "puts 'Fake admin-ui is running...'"
    sleep 1
  done

else
  echo Starting web process
  exec bundle exec puma -C puma.rb
fi
