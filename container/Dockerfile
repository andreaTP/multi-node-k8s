FROM ubuntu/nginx

RUN apt-get update

RUN apt-get install -y openssh-server less curl iputils-ping sudo
RUN mkdir /var/run/sshd 
EXPOSE 22
RUN \
  useradd -ms /bin/bash akka && \
  usermod -U akka && \
  chown -R akka:akka /home/akka && \
  echo "akka:akka" | chpasswd && \
  echo "IdentityFile /root/.ssh/id_rsa" >> /etc/ssh/ssh_config && \
  echo "StrictHostKeyChecking accept-new" >> /etc/ssh/ssh_config && \
  echo "LogLevel VERBOSE" >> /etc/ssh/ssh_config && \
  echo "LogLevel VERBOSE" >> /etc/ssh/sshd_config  && \
  sed -ri 's/UsePAM yes/#UsePAM yes/g' /etc/ssh/sshd_config && \
  sed -ri 's/^StrictModes\s+.*/StrictModes no/' /etc/ssh/sshd_config && \
  echo "PasswordAuthentication no" >> /etc/ssh/sshd_config && \
  echo "AuthorizedKeysFile /root/.ssh/authorized_keys" >> /etc/ssh/sshd_config && \ 
  echo "PermitRootLogin yes" >> /etc/ssh/sshd_config
CMD  ["/usr/sbin/sshd", "-De"]

