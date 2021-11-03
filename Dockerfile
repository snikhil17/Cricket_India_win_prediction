FROM python:3.8.12-slim

LABEL maintainer="Nikhil Shrestha"

ENV PYTHONUNBUFFERED=TRUE

RUN pip --no-cache-dir install pipenv

WORKDIR /app

COPY ["Pipfile", "Pipfile.lock", "./"]

RUN set -ex && pipenv install --deploy --system

COPY ["predict.py", "model_rf.bin", "./"]

EXPOSE 9696

ENTRYPOINT ["gunicorn", "--bind=0.0.0.0:9696", "predict:app"]