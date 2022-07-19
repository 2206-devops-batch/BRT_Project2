whoami
pwd

# run python test
python3 -m pytest test-app.py

COMMIT="$(git log -1 --pretty=format:"%s")"
echo $COMMIT | grep -i "rollback"
echo "$?"
echo "***********************************************"
# This only runs if pytest passes!
# if [[ $? -eq 0 ]]; then
# VERSION="$(git log -1 --pretty=format:"%H")"
# echo $VERSION
# docker build -t "bryonsmith/flaskapp-demo:$VERSION" . < Dockerfile
# echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin
# docker push "bryonsmith/flaskapp-demo:$VERSION"

# kubectl set image deployment/flask-deployment flaskapp="bryonsmith/flaskapp-demo:$VERSION"


# build failure
else
echo "Pytest Failure! Docker did not run or push!!!!!!!!!!!!!!!\nEmailing $(git log -1 --pretty=format:"committer: %cn, email: %ce, last commit message: \"%s\"")"
fi
