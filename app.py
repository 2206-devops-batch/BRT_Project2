from flask import Flask

app = Flask(__name__)

@app.route("/")
def hello_world():
    return "<p>Hello, World!</p>"
#added a typo to test a git push
@app.route("/<name>")
def hello_name(name):
    return "<p>Hello, " + name + "!</p>"
