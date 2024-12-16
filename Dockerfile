FROM alpine

RUN apk add --no-cache tzdata samba

VOLUME ["/shares"]

EXPOSE 137/udp 139 445

ENTRYPOINT ["smbd"]
CMD ["--foreground", "--debug-stdout",  "--no-process-group"]

