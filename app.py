from flask import Flask

app = Flask(__name__)

# home route 
@app.route("/")
def hello_world():
    return "<p>Hello, World!</p>"

# added a typo to test a git push
@app.route("/<name>")
def hello_name(name):
    return "<p>Hello, " + name + "!</p>"

# add new route goodbye 
@app.route("/goodbye/<name>")
def goodbye_name(name):
    return "<p>Goodbye, " + name + "!</p>"
