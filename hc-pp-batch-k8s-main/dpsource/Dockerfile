FROM centos:centos7

#RUN yum install -y compat-openssl10
#RUN yum install -y libnsl
#RUN yum install -y python2-devel
#RUN yum install -y python-qpid python-qpid-common
#RUN yum install -y MySQL-python

RUN mkdir -p /usr/lib64/mysql
ADD lib/libmysqlclient.so.20.3.17 /usr/lib64/mysql/
RUN ln -s /usr/lib64/mysql/libmysqlclient.so.20.3.17 /usr/lib64/mysql/libmysqlclient.so.20
RUN ln -s /usr/lib64/mysql/libmysqlclient.so.20.3.17 /usr/lib64/mysql/libmysqlclient.so

ADD lib/libqpidclient.so.2.0.0 /lib64/
RUN ln -s /lib64/libqpidclient.so.2.0.0 /lib64/libqpidclient.so.2
RUN ln -s /lib64/libqpidclient.so.2.0.0 /lib64/libqpidclient.so
ADD lib/libqpidcommon.so.2.0.0 /lib64/
RUN ln -s /lib64/libqpidcommon.so.2.0.0 /lib64/libqpidcommon.so.2
RUN ln -s /lib64/libqpidcommon.so.2.0.0 /lib64/libqpidcommon.so
ADD lib/libqpidmessaging.so.2.0.0 /lib64/
RUN ln -s /lib64/libqpidmessaging.so.2.0.0 /lib64/libqpidmessaging.so.2
RUN ln -s /lib64/libqpidmessaging.so.2.0.0 /lib64/libqpidmessaging.so
ADD lib/libqpidtypes.so.1.0.0 /lib64/
RUN ln -s /lib64/libqpidtypes.so.1.0.0 /lib64/libqpidtypes.so.1
RUN ln -s /lib64/libqpidtypes.so.1.0.0 /lib64/libqpidtypes.so
ADD lib/libqpid-proton-core.so.10.9.0 /lib64/
RUN ln -s /lib64/libqpid-proton-core.so.10.9.0 /lib64/libqpid-proton-core.so.10
RUN ln -s /lib64/libqpid-proton-core.so.10.9.0 /lib64/libqpid-proton-core.so
ADD lib/libboost_program_options-mt.so.1.53.0 /lib64/
RUN ln -s /lib64/libboost_program_options-mt.so.1.53.0 /lib64/libboost_program_options-mt.so

ENV LD_LIBRARY_PATH /usr/lib64/mysql:/opt/postware_8.0/dtr_iqlib:/opt/postware3/Data_Quality_Mgmt_SDK/linux_x86_64/bin:$LD_LIBRARY_PATH

RUN mkdir -p /opt/enclarity
ADD enclarity /opt/enclarity/

RUN mkdir -p /data/webservice
ADD webservice /data/webservice

RUN mkdir -p /opt/postware2
ADD postware2 /opt/postware2
RUN mkdir -p /opt/postware3
ADD postware3 /opt/postware3
RUN mkdir -p /opt/postware_8.0
ADD postware_8.0 /opt/postware_8.0
VOLUME ["/opt/postware2/dirs"]

WORKDIR /data/webservice

RUN mkdir -p /var/run/webservice
CMD /opt/enclarity/prd/6.7/bin/dpsource -c /opt/enclarity/prd/6.7/bin/webrealtime2.config -d prod32 --dbhost $MYSQL_HOST -t WSD6_7 -u DPsource_6_7_1 -a $QPID_HOST
