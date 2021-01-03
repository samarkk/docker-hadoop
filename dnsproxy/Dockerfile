# Dockerfile for a DNS proxy
FROM alpine:latest

RUN apk add --no-cache dnsmasq

EXPOSE 53/udp

CMD ip a && dnsmasq -u root --no-daemon