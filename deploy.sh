host="web-server"

appName=$(basename "$PWD")
rootDir="~/static-sites"
appDir="$rootDir/$appName"

pnpm build

ssh $host -C "
  mkdir -p $appDir
  rm -r $appDir
"
scp -r build $host:$appDir
