FROM python:3-slim AS builder

WORKDIR /usr/src/app
RUN apt-get update && \
    apt-get install -y gcc libtk8.6 && \
    rm -rf /var/lib/apt/lists/*

COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

COPY YTSpammerPurge.py ./
COPY SpamPurgeConfig.ini ./
ADD Scripts ./Scripts
ADD assets ./assets

CMD [ "python", "YTSpammerPurge.py" ]
