FROM ubuntu:jammy

# Set noninteractive mode for apt-get
ENV DEBIAN_FRONTEND noninteractive

# Update
RUN --mount=type=cache,target=/var/lib/apt,sharing=locked \
    --mount=type=cache,target=/var/cache/apt,sharing=locked \
    apt-get update &&\
    # Start editing
    # Install package here for cache
    apt-get -y install  postfix sasl2-bin opendkim opendkim-tools 

# Add files
ADD assets/docker-entrypoint.sh /

# Run
CMD ["/docker-entrypoint.sh"]