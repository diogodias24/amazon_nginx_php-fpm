FROM amazonlinux
LABEL Diogo Dias <saidogoid2@gmail.com>

RUN yum -y update && yum -y upgrade && yum -y install \
 	sudo \
	nano \
	initscripts \
	openssh \
	git \
	zip \
	unzip \
	vim \
	mysql \
	wget \
	&& useradd -ms /bin/bash ec2-user && echo "ec2-user:ec2-user" | chpasswd &&  usermod -a -G wheel ec2-user \
  	&& echo '%wheel ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

EXPOSE 80 443 3306

USER ec2-user
WORKDIR /home/ec2-user

CMD /bin/bash


#CMD [“/sbin/init”]
