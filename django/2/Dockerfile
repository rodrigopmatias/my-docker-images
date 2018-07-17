FROM matias/python:3.6

ARG REPO
ENV REPO=${REPO}

CMD ["/app/env/bin/python", "/app/src/manage.py", "runserver", "0.0.0.0:8000"]
