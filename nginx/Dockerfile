##
# magento2 nginx + php env
# Support Magento2 Version
# 2.4.3
##
FROM aomitech/magento2:1.0.0-env

ENV DEBIAN_FRONTEND=noninteractive

COPY docker-entrypoint.sh /docker-entrypoint.sh

RUN apt-get update && apt-get install -y nginx; \
    # Clean up
    apt-get clean; \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/; \
    chmod +x /docker-entrypoint.sh; \
    ln -sf /dev/stdout /var/log/nginx/access.log && ln -sf /dev/stderr /var/log/nginx/error.log

CMD ["/docker-entrypoint.sh"]

