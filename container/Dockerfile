FROM ubuntu:nginx

RUN apt-get update

RUN apt-get install -y openssh-server sudo less curl iputils-ping
RUN mkdir /var/run/sshd
EXPOSE 22
# instead mount, can you add other location for authorized_keys? (AuthorizedKeyFile)
ADD authorized_keys /home/akka/.ssh/authorized_keys
ADD id_rsa /home/akka/.ssh/id_rsa
RUN \
  useradd -ms /bin/bash akka && \
  usermod -U akka && \
  chown -R akka:akka /home/akka && \
  echo "akka:akka" | chpasswd && \
  sed -ri 's/UsePAM yes/#UsePAM yes/g' /etc/ssh/sshd_config && \
  sed -ri 's/^StrictModes\s+.*/StrictModes no/' /etc/ssh/sshd_config && \
  echo "PasswordAuthentication no" >> /etc/ssh/sshd_config && \
  # Maybe do this instead and mount a volume on it, generate the keys from the outside.
  # echo "IdentityFile /home/akka/keys/id_rsa" >> /etc/ssh/ssh_config && \
  echo "StrictHostKeyChecking accept-new" >> /etc/ssh/ssh_config && \
  echo "LogLevel ERROR" >> /etc/ssh/ssh_config
USER akka