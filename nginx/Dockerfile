##
# magento2 nginx + php env
# Support Magento2 Version
# 2.4.3
##
FROM aomitech/magento2:1.0.0-env

COPY docker-entrypoint.sh /docker-entrypoint.sh

RUN apt-get update && apt-get install -y nginx; \
    # Clean up
    apt-get clean; \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/; \
    chmod +x /docker-entrypoint.sh
    
CMD ["/docker-entrypoint.sh"]

