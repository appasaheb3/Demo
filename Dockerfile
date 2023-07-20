FROM python:3.9
WORKDIR /demo
COPY requirements.txt .
RUN pip install -r requirements.txt
COPY . /demo
EXPOSE 5000
CMD python manage.py runserver 0.0.0.0:5000