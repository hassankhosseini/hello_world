#!/bin/bash

if [ "$ENTRYPOINT" = "worker" ]
then
  echo Starting workers
  ruby -e "puts 'Fake workers running...'"
elif [ "$ENTRYPOINT" = "admin_ui" ]
then
  echo Starting admin_ui
  ruby -e "puts 'Fake admin_ui is running...'"
else
  echo Starting web process
  bundle exec puma -C puma.rb
fi
