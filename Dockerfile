FROM ros:foxy-ros-base-focal
MAINTAINER KUDO Shunsuke

ARG DEBIAN_FRONTEND=noninteractive
RUN apt update \
    && apt upgrade -y \
    && apt install -y \
        git \
        ninja-build \
        ros-${ROS_DISTRO}-desktop \
        sudo \
        supervisor \
        tmux \
        vim \
    && rm -rf /var/lib/apt/lists/* \
    && echo "if [ -e /root/.myprofile ]; then source /root/.myprofile; fi" >> /root/.bashrc

CMD /usr/bin/supervisord -nc /etc/supervisor/supervisord.conf
