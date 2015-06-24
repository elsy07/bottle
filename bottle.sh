mkdir bottle
cd bottle
pip install virtualenv==12.0.7
virtualenv venv
source venv/bin/activate
pip install bottle==0.12.8
pip freeze > requirements.txt
git init
git add .
git commit -m "initial commit"
 
cat >app.py <<EOF
import os
from bottle import route, run, template

index_html = '''My first web app! By <strong>{{ author }}</strong>.'''


@route('/')
def index():
    return template(index_html, author='Real Python')


@route('/name/<name>')
def name(name):
    return template(index_html, author=name)


if __name__ == '__main__':
    port = int(os.environ.get('PORT', 8080))
    run(host='0.0.0.0', port=port, debug=True)
EOF
 
chmod a+x app.py
 
git init
git add .
git commit -m "Updated"
