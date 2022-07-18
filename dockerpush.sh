whoami
pwd

# run python test
python3 -m pytest test-app.py

# This only runs if pytest passes!
if [[ $? -eq 0 ]]; then
VERSION="$(git log -1 --pretty=format:"%H")"
echo $VERSION
docker build -t "bryonsmith/flaskapp-demo:$VERSION" . < Dockerfile
echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin
docker push "bryonsmith/flaskapp-demo:$VERSION"

else
echo "Pytest Failure! Docker did not run or push!!!!!!!!!!!!!!!"
fi