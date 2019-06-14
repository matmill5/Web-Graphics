
# A very simple Flask Hello World app for you to get started with...

from flask import Flask, redirect

app = Flask(__name__)

@app.route('/')
def index():
    return redirect("/static/examples.html")

