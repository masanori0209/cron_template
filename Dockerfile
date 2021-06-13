FROM ubuntu:16.04

RUN apt update && apt install -y cron

COPY task.sh /usr/local/bin/
COPY cron-example /etc/cron.d/
RUN chmod 0644 /etc/cron.d/cron-example
RUN touch /var/log/cron.log

CMD cron && tail -f /var/log/cron.log