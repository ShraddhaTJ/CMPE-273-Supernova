from flask import Flask, render_template, request
import jsonify

app = Flask(__name__)


@app.route("/")
def loadIndex():
    return render_template("index.html")


@app.route("/login", methods=['POST'])
def login():
    return render_template("login.html")


@app.route("/register", methods=['POST'])
def registerUser():
    return render_template("register.html")


@app.route("/userbuy", methods=['POST'])
def sell():
    return render_template("userbuy.html")


@app.route("/userclaim", methods=['POST'])
def buy():
    return render_template("userclaim.html")


if __name__ == '__main__':
    app.run(port=3002, debug=True)
