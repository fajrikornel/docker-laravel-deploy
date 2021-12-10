echo "Destroying containers"
docker rm -f laravel-cont mysql

echo "Destroying network"
docker network rm test-laravel

echo "y" | docker volume prune