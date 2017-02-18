bundle exec rspec spec

if [[ $? == 0 ]]
then
  curl "https://api.github.com/repos/abarcloud/hello_world/statuses/$OPENSHIFT_BUILD_COMMIT?access_token=$GH_TOKEN" \
    -H "Content-Type: application/json" \
    -X POST \
    -d "{\"state\": \"success\", \"description\": \"Live AbarCloud Link\", \"target_url\": \"https://helloworld-ci-cd.abar.cloud/\"}"
  exit 0
else
  curl "https://api.github.com/repos/abarcloud/hello_world/statuses/$OPENSHIFT_BUILD_COMMIT?access_token=$GH_TOKEN" \
    -H "Content-Type: application/json" \
    -X POST \
    -d "{\"state\": \"failure\", \"description\": \"AbarCloud\", \"target_url\": \"https://dashboard.abarcloud.com/console/project/$OPENSHIFT_BUILD_NAMESPACE/browse/builds/helloworld/$OPENSHIFT_BUILD_NAME?tab=logs\"}"
  exit 1
fi
