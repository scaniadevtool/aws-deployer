# bump version
cd aws-deployer
docker run --rm -v "$PWD":/app treeder/bump "$(git log -1 --pretty=%B)"

version=`cat VERSION`
echo "version: $version"
echo 
cd ..
# tag it
echo 'Tagging with new version'
git add -A
git commit -m "version $version"
git tag -a "$version" -m "version $version"
git push
git push --tags
