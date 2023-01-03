FROM --platform=$TARGETPLATFORM python:3.11.0-alpine3.16


LABEL maintainer="ALMAS <almas1992@126.com>"

# Copy files necessary installation
COPY requirements.txt requirements.txt

RUN apk --no-cache add git \
    && pip install --no-cache-dir -r requirements.txt

# Set working directory
WORKDIR /docs

# Expose MkDocs development server port
EXPOSE 8000

# Start development server by default
ENTRYPOINT ["mkdocs"]
CMD ["serve", "--dev-addr=0.0.0.0:8000"]