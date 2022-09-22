FROM registry.cn-hangzhou.aliyuncs.com/rancher/stable-edge-ngx1.15

RUN apk add --no-cache curl

COPY . /usr/share/nginx/html
COPY nginx.conf /etc/nginx/nginx.conf
COPY nginx.vh.default.conf /etc/nginx/conf.d/default.conf
COPY js.txt /home/js.txt
COPY css.txt /home/css.txt

RUN cd /usr/share/nginx/html/js; for i in $(cat /home/js.txt); do echo ${i}; curl -O ${i}; done;
RUN cd /usr/share/nginx/html/css; for i in $(cat /home/css.txt); do echo ${i}; curl -O ${i}; done;