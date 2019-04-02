FROM diogodias2/amazon_ami2

LABEL Diogo Dias <saidogoid2@gmail.com>

USER root 

RUN amazon-linux-extras install -y nginx1.12 && sudo amazon-linux-extras install -y php7.2 \
	&& chown -R ec2-user /var/log/nginx /var/lib/nginx/ \
	&& chkconfig nginx on && chkconfig php-fpm on

EXPOSE 80 443 

#ADD ./index.html /usr/share/nginx/html/

WORKDIR /home/ec2-user

VOLUME [ "/sys/fs/cgroup" ]

CMD ["/usr/sbin/init"]

#USER ec2-user 
#THE SYSTEM CANT RUN WITH OTHER USER THAN ROOT
