FROM cgr.dev/chainguard/atlantis:latest

USER root

RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" \
    && unzip awscliv2.zip \
    && ./aws/install --bin-dir /usr/local/bin --install-dir /usr/local/aws-cli --update \
    && rm -rf awscliv2.zip aws

RUN mkdir -p /home/atlantis/.aws
RUN touch /home/atlantis/.aws/credentials

RUN chown -R root:root /home/atlantis/.aws