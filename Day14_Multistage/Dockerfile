FROM python:3.10-slim AS build

WORKDIR /app
RUN pip install flask
COPY app.py .
CMD ["python", "app.py"]


