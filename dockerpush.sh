whoami
pwd
# run python test
python3 -m pytest test-app.py
# This only runs if pytest passes!
if [[ $? -eq 0 ]]; then
docker build -t bryonsmith/flaskapp-demo:v1 . < Dockerfile
docker push bryonsmith/flaskapp-demo:v1
else
echo "Pytest Failure! Docker did not run or push!!!!!!!!!!!!!!!"
fi