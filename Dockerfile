FROM archlinux:latest
COPY . .
ENTRYPOINT ["/install"]
