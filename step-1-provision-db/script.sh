for db in aff-tracking \
          beecow \
          beecow-item \
          beecow-item-etl \
          beecow-order \
          beecow-shopee \
          comment-services \
          common-history \
          common-ticket \
          datawarehouse \
          ewarranty \
          forum \
          system-services; \
          do docker compose -f ./postgres.yml --env-file ./env-files/$db up -d; done