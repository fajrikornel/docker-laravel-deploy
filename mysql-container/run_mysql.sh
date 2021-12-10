docker container run \
    --network $NETWORK \
    -p 1234:3306 \
    -v /var/lib/mysql \
    -v $ROOT_DIR/mysql-container/schema.sql:/docker-entrypoint-initdb.d/schema.sql:ro \
    --env-file $ROOT_DIR/mysql-container/.env.mysql \
    -d --name mysql \
    mysql:5.7
