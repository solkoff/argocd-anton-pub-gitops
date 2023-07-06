#!/bin/bash

set -e #exits for non-zero exit status value

#get a version from a user
new_version=$1

#print a new image version
echo "================================"
echo "new version is: ${new_version}"
echo "================================"

# tag a new image version
nerdctl tag nginx:1.23 solkoff/nginx:${new_version}

#push a new image version to a hub
nerdctl push solkoff/nginx:${new_version}

temp_dir=$(mktemp -d)
echo "================================"
echo "Temp directory is: ${temp_dir}"
echo "================================"

echo "Clonning repo..."
echo "================================"

# clone repo
git clone https://github.com/solkoff/argocd-anton-pub-application.git ${temp_dir}

#make changes to tags
sed -i '' -e "s/docker.io\/solkoff\/nginx:.*/docker.io\/solkoff\/nginx:${new_version}/g" ${temp_dir}/myapp/deployment.yaml

echo "================================"
echo "commining changes"
#commit the changes
cd ${temp_dir}
git add .
git commit -am "image tag is ${new_version}"
git push

echo "================================"
echo "deleting temporary directory"
#delete the temp directory
rm -Rf ${temp_dir}