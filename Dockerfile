FROM python:3.8-slim

ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1 \
    OPCUA_HOST=0.0.0.0 \
    OPCUA_PORT=4840 \
    OPCUA_PATH=/opcua/ \
    SENSOR_CSV=/app/sensor.csv

WORKDIR /app

COPY requirements.txt .
RUN python -m pip install --no-cache-dir --upgrade pip \
    && python -m pip install --no-cache-dir -r requirements.txt

COPY opc-ua-server.py sensor.csv.zip ./
RUN python -m zipfile -e sensor.csv.zip .

EXPOSE 4840

CMD ["python", "opc-ua-server.py"]
