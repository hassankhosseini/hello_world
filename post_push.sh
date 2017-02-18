bundle exec rspec spec

if [[ $? == 0 ]]
then
  export STATUS="success"
else
  export STATUS="failure"
fi

curl "https://api.github.com/repos/alikhajeh1/hello_world/statuses/$OPENSHIFT_BUILD_COMMIT?access_token=$GH_TOKEN" \
  -H "Content-Type: application/json" \
  -X POST \
  -d "{\"state\": \"$STATUS\", \"description\": \"AbarCloud\", \"target_url\": \"https://dashboard.abarcloud.com/console/project/$OPENSHIFT_BUILD_NAMESPACE/browse/builds/helloworld/$OPENSHIFT_BUILD_NAME?tab=logs\"}"

if [[ $STATUS == "success" ]]
then
  exit 0
else
  exit 1
fi
