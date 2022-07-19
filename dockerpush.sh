whoami
pwd

# run python test
python3 -m pytest test-app.py




# This only runs if pytest passes!
if [[ $? -eq 0 ]]; then

COMMIT="$(git log -1 --pretty=format:"%s")"
# run this if ROLLBACK is empty 
if [[ -z "$(echo "$COMMIT" | grep -i "rollback")" ]]; then
echo "Rollback not found in commit message."

VERSION="$(git log -1 --pretty=format:"%H")"
echo $VERSION
docker build -t "bryonsmith/flaskapp-demo:$VERSION" . < Dockerfile
echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin
docker push "bryonsmith/flaskapp-demo:$VERSION"

aws eks update-kubeconfig --name flaskapp-v3
kubectl set image deployment/flask-deployment flaskapp="bryonsmith/flaskapp-demo:$VERSION"

# run this if grep finds ROLLBACK in commit message.
else
echo "Found rollback in commit message!"
kubectl rollout undo deployment/flask-deployment
fi



# build failure
else
echo "Pytest Failure! Docker did not run or push!!!!!!!!!!!!!!!\nEmailing $(git log -1 --pretty=format:"committer: %cn, email: %ce, last commit message: \"%s\"")"
fi
