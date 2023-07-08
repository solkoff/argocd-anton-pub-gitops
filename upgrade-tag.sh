#!/bin/bash

set -e #exits for non-zero exit status value

#get a version from a user
new_version=$1

#print a new image version
echo "================================"
echo "new version is: ${new_version}"
echo "================================"
echo "creating a new image with a tag ${new_version}"
echo "================================"

# tag a new image version
nerdctl tag nginx:1.23 solkoff/nginx:${new_version}

#push a new image version to a hub
nerdctl push solkoff/nginx:${new_version}

temp_dir=$(mktemp -d)
echo "================================"
echo "Creating temp directory. Temp directory is: ${temp_dir}"
echo "================================"
echo "Clonning repo..."
echo "================================"

# clone repo
git clone https://github.com/solkoff/argocd-anton-pub-application.git ${temp_dir}

#make changes to tags
sed -i '' -e "s/docker.io\/solkoff\/nginx:.*/docker.io\/solkoff\/nginx:${new_version}/g" ${temp_dir}/myapp-initial/deployment.yaml

echo "================================"
echo "commining changes to the Repo"
echo "================================"
#commit the changes
cd ${temp_dir}
git add .
git commit -am "image tag is ${new_version}"
git push

echo "================================"
echo "deleting temporary directory"
echo "================================"
#delete the temp directory
rm -Rf ${temp_dir}
echo "================================"
echo "done"
echo "================================"