FROM ubuntu:16.04

# Update and install only required packages
RUN apt-get -qq update && \
    apt-get install -y --no-install-recommends --reinstall ca-certificates \
        git \
        make \
        gcc-multilib \
        qemu-system-x86 \
    && git clone https://github.com/mit-pdos/xv6-public.git /xv6 \
    && chmod +x /xv6/*.pl \
    \
    # Cleanup stage (-20% size)
    && apt-get purge -qq git \
    && apt-get autoremove --purge -qq \
    && apt-get clean -qq \
    && rm -rf /var/lib/apt/lists/* \
    && rm -rf /tmp/* /var/tmp/* \
    && rm -rf /usr/share/man/* /usr/share/doc/*


WORKDIR /xv6

CMD ["/bin/bash"]
