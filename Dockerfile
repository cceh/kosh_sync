FROM alpine
RUN apk --no-cache add git
COPY entrypoint.sh /entrypoint.sh
CMD /entrypoint.sh
