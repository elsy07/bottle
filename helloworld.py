# -*- coding: utf-8 -*-
import os
from bottle import route, run, template

index_html = '''hello world →_→ <strong>{{ author }}</strong> hate you.'''


@route('/')
def index():
    return template(index_html, author='elsy')


@route('/name/<name>')
def name(name):
    return template(index_html, author=name)


if __name__ == '__main__':
    port = int(os.environ.get('PORT', 8080))
    run(host='0.0.0.0', port=port, debug=True)
