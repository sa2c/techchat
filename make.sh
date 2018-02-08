if [ -x "$(command -v python3)" ]
then
    PYTHON=python3
elif [ -x "$(command -v python36)" ]
then
    PYTHON=python36
else
    echo Python 3 not found
    exit 1
fi

if [ ! -f "clinic/bin/activate" ]
then
    $PYTHON -m venv seminar
    source seminar/bin/activate
    pip install -r requirements.txt
else
    source seminar/bin/activate
fi

source seminar/bin/activate
python3 ./generate.py seminars site/index.html --annual_template=annual_template.html
