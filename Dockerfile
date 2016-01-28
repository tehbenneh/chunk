FROM dtank/core:latest

MAINTAINER benharker@mac.com

RUN wget -O - http://ppa.moosefs.com/moosefs.key | apt-key add - && echo "deb http://ppa.moosefs.com/current/apt/ubuntu/trusty trusty main" >> /etc/apt/sources.list.d/moosefs.list ;
RUN apt-get update ; apt-get install -y moosefs-chunkserver nano ; mv /etc/mfs/mfschunkserver.cfg.sample /etc/mfs/mfschunkserver.cfg ; mv /etc/mfs/mfshdd.cfg.sample /etc/mfs/mfshdd.cfg ; echo "/mnt/mfschunks/ 1GiB" >> /etc/mfs/mfshdd.cfg ;

EXPOSE 9420
EXPOSE 9422

CMD ["/usr/sbin/mfschunkserver", "-f", "start"]
