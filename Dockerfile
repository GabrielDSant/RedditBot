FROM python:3.10.14

RUN apt update && apt-get install -y ffmpeg python3-pip curl

WORKDIR /app

RUN pip install playwright
RUN python -m playwright install
RUN python -m playwright install-deps

# Copia o entrypoint para o container
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# Define o script como ENTRYPOINT
ENTRYPOINT ["/entrypoint.sh"]
