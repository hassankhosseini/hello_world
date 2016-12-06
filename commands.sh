#!/bin/bash

if [ "$ENTRYPOINT" = "workers" ]
then
  echo Starting workers
  while :
  do
    ruby -e "puts 'Fake worker running...'"
    sleep 1
  done

elif [ "$ENTRYPOINT" = "admin_ui" ]
then
  echo Starting admin_ui
  while :
  do
    ruby -e "puts 'Fake admin_ui is running...'"
    sleep 1
  done

else
  echo Starting web process
  bundle exec puma -C puma.rb
fi
