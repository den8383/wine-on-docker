FROM ubuntu:18.04
RUN apt-get update && apt-get install -y openssh-server
RUN mkdir /var/run/sshd
RUN echo 'root:THEPASSWORDYOUCREATED' | chpasswd
RUN sed -i 's/PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config
# SSH login fix. Otherwise user is kicked off after login
RUN sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd
ENV NOTVISIBLE "in users profile"
RUN echo "export VISIBLE=now" >> /etc/profile
RUN echo PermitRootLogin yes >> /etc/ssh/sshd_config
CMD ["/usr/sbin/sshd", "-D"]


ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get upgrade -y

RUN apt install xserver-xorg -y
RUN apt-get install -y x11-apps
RUN apt-get install  xorg -y

RUN apt-get install curl -y


RUN dpkg --add-architecture i386
RUN apt-get update -y
RUN apt-get install --no-install-recommends software-properties-common -y
RUN apt-get update -y
RUN apt-get install wine1.7 winetricks winbind -y

RUN apt-get install language-pack-ja -y && update-locale LANG=ja_JP.UTF-8
RUN apt-get install fonts-takao fonts-takao-gothic fonts-takao-pgothic fonts-takao-mincho
RUN sed -i -e 's/^XKBMODEL="pc105"/XKBMODEL="jp106"/g' /etc/default/keyboard
RUN sed -i -e 's/^XKBLAYOUT="us"/XKBLAYOUT="jp"/g' /etc/default/keyboard
RUN apt-get purge software-properties-common -y
RUN apt-get autoclean -y

RUN export uid=1000 gid=1000 && \
    mkdir -p /home/wineuser && \
    echo "wineuser:x:${uid}:${gid}:Developer,,,:/home/wineuser:/bin/bash" >> /etc/passwd && \
    echo "wineuser:x:${uid}:" >> /etc/group && \
    echo "wineuser ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/wineuser && \
    chmod 0440 /etc/sudoers.d/wineuser && \
    chown ${uid}:${gid} -R /home/wineuser

USER wineuser
WORKDIR /home/wineuser



