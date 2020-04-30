FROM archlinux:latest
MAINTAINER riazarbi

RUN useradd -ms /bin/bash thunderbird
RUN passwd -d thunderbird
ADD run.sh /
RUN chmod +x /run.sh

# Install ssh and xorg
RUN pacman -Syu --noconfirm && \
    # Install X related stuff and some fonts.
    pacman --noconfirm -S openssh xterm xorg-xclock xorg-xcalc xorg-xauth xorg-xeyes ttf-droid && \
    # Turn on X11Forwarding and allow remote X11
    echo "X11Forwarding yes" >> /etc/ssh/sshd_config && \
    echo "X11UseLocalhost no" >> /etc/ssh/sshd_config && \
    # Setup our SSH
    echo "PasswordAuthentication no" >> /etc/ssh/sshd_config && \
    # Disable PAM so the container doesn't need privs.
    sed -i "s/UsePAM yes/UsePAM no/" /etc/ssh/sshd_config && \
    # Enable X11 for docker user
    runuser -l thunderbird -c "touch /home/thunderbird/.Xauthority" && \
    touch $HOME/.Xauthority && \
    # Install thunderbird
    pacman --noconfirm -S thunderbird \
        libcanberra \
        alltray \
        psmisc \
        --assume-installed hwids \
        --assume-installed kbd \
        --assume-installed kmod \
        --assume-installed libseccomp \
        --assume-installed systemd

USER thunderbird
WORKDIR /home/thunderbird
RUN mkdir -p /home/thunderbird/.thunderbird && chown -R thunderbird:thunderbird /home/thunderbird/.thunderbird

USER root

CMD ["/run.sh"]
