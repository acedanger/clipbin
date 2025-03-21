FROM python:3-slim

WORKDIR /app
COPY . /app
COPY requirements.txt .

# Install necessary packages and clean up
RUN apt-get update \
  && apt-get install -y --no-install-recommends bash \
  && rm -rf /var/lib/apt/lists/*

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

ENV FLASK_APP=app.py
# ENV FLASK_ENV=development

CMD ["flask", "run", "--host=0.0.0.0", "--port=5000"]