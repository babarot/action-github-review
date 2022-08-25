FROM golang:1.13.7-stretch

ENV VERSION=v0.1.0

RUN apt-get update && apt-get install -y --no-install-recommends \
        ca-certificates \
        jq \
        vim \
    && rm -rf /var/lib/apt/lists/*

# Install b4b4r07/github-review
RUN wget -O /tmp/github-review-${VERSION}-linux-amd64.tar.gz \
    https://github.com/b4b4r07/github-review/releases/download/${VERSION}/github-review_linux_x86_64.tar.gz \
    && cd /tmp \
    && tar -zxvf github-review-${VERSION}_linux_amd64.tar.gz \
    && mv github-review /usr/local/bin/ \
    && rm github-review-${VERSION}_linux_amd64.tar.gz

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
