FROM ubuntu:22.04

# Prevent interactive prompts during installation
ENV DEBIAN_FRONTEND=noninteractive

# Install essential packages
RUN apt-get update && apt-get install -y \
    xfce4 \
    xfce4-goodies \
    xrdp \
    supervisor \
    sudo \
    wget \
    curl \
    nano \
    vim \
    firefox \
    git \
    net-tools \
    dbus-x11 \
    xorgxrdp \
    python3 \
    python3-pip \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Configure xrdp
RUN sed -i 's/^new_cursors=true/new_cursors=false/g' /etc/xrdp/xrdp.ini && \
    sed -i 's/max_bpp=32/max_bpp=128/g' /etc/xrdp/xrdp.ini && \
    sed -i 's/#rsakeys_ini/rsakeys_ini/g' /etc/xrdp/xrdp.ini

# Set up XFCE as default session
RUN echo "xfce4-session" > /etc/skel/.xsession

# Create RDP user with configurable password
ARG RDP_USER=rdpuser
ARG RDP_PASSWORD=ChangeMe123!

RUN useradd -m -s /bin/bash ${RDP_USER} && \
    echo "${RDP_USER}:${RDP_PASSWORD}" | chpasswd && \
    usermod -aG sudo ${RDP_USER} && \
    echo "${RDP_USER} ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

# Configure xrdp to use certificate
RUN xrdp-keygen xrdp auto

# Create supervisor configuration
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

# Create startup script
COPY start.sh /start.sh
RUN chmod +x /start.sh

# Expose RDP port and HTTP port for health checks
EXPOSE 3389 8000

# Health check
HEALTHCHECK --interval=30s --timeout=10s --start-period=40s --retries=3 \
    CMD netstat -an | grep 3389 > /dev/null; if [ 0 != $? ]; then exit 1; fi;

# Start services
CMD ["/start.sh"]
