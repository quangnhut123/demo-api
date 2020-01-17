from flask import Flask
app = Flask(__name__)

@app.route('/', defaults={'path': ''})
@app.route('/<path:path>')
def catch_all(path):
    return 'Your current path is : /%s' % path

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=3000)