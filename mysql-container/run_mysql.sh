docker container run \
    --network $DOCKER_NETWORK \
    -p $MYSQL_PORT:3306 \
    -v /var/lib/mysql \
    -v $ROOT_DIR/mysql-container/schema.sql:/docker-entrypoint-initdb.d/schema.sql:ro \
    --env-file $ROOT_DIR/mysql-container/.env.mysql \
    -d --name $MYSQL_CONTAINER \
    mysql:5.7
