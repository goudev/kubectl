FROM alpine
ADD ./entrypoint.sh /usr/local/bin/entrypoint
RUN apk add --no-cache curl && \
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl" && \
chmod +x kubectl && \
mv kubectl /usr/local/bin/ && \
chmod +x /usr/local/bin/kubectl && \
apk del curl && \
chmod +x /usr/local/bin/entrypoint
CMD [ "/usr/local/bin/entrypoint" ] 