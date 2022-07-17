whoami
pwd
# run python test
python3 -m pytest test-app.py
chmod +x dockerpush.sh
# This only runs if pytest passes!
if [[ $? -eq 0 ]]; then
docker build -t bryonsmith/flaskapp-demo:v1 . < Dockerfile
docker push bryonsmith/flaskakapp-demo:v1
echo "Success!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
else
echo "Pytest Failure! Docker did not run or push!!!!!!!!!!!!!!!"
fi