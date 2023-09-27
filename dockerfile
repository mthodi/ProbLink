FROM ubuntu:18.04

RUN apt-get update && \
    apt-get install -y python python-pip python3 python3-pip && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY requirements.txt .

# Copy current directory to /app
COPY . /app

RUN pip install --no-cache-dir -r requirements.txt


CMD ["bash"]
