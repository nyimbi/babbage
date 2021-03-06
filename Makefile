
test: install
	env/bin/nosetests --with-coverage --cover-package=babbage --cover-erase

install: env/bin/python

env/bin/python:
	virtualenv env
	env/bin/pip install --upgrade pip
	env/bin/pip install -e .
	env/bin/pip install nose wheel coverage Flask-Testing unicodecsv python-dateutil

upload: install
	env/bin/python setup.py sdist bdist_wheel upload

clean:
	rm -rf env
