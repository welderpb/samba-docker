FROM alpine

RUN apk add --no-cache tzdata samba dumb-init

VOLUME ["/shares"]

EXPOSE 137/udp 139 445

COPY ./smbusers /

COPY ./entrypoint.sh /
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["dumb-init", "/entrypoint.sh"]
CMD ["--foreground", "--debug-stdout",  "--no-process-group"]

