FROM golang:1.24

# 2.4 Webservice

RUN apt-get install -y git
RUN apt-get install -y screen
RUN git clone --depth 1 https://github.com/Lars5Janssen/its-pw.git /webservice-go
RUN cd /webservice-go && /usr/local/go/bin/go build -o /webservice-go/webservice /webservice-go/main.go
RUN rm -rf /webservice-go
# RMV to trigger rebuild of app

RUN pwd
RUN git clone --depth 1 https://github.com/Lars5Janssen/its-pw.git /webservice-go
RUN cp -r /webservice-go/templates/ /templates
RUN cd /webservice-go && /usr/local/go/bin/go build -o /webservice-go/webservice /webservice-go/main.go
