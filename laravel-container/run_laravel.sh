docker container run \
    --network $DOCKER_NETWORK \
    -p $LARAVEL_PORT:80 \
    --env-file $ROOT_DIR/laravel-container/.env.laravel \
    -d --name $LARAVEL_CONTAINER \
    dockerlaraveldeploy:latest