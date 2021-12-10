docker container run \
    --network $DOCKER_NETWORK \
    -p 2345:80 \
    --env-file $ROOT_DIR/laravel-container/.env.laravel \
    -d --name laravel-cont \
    dockerlaraveldeploy:latest