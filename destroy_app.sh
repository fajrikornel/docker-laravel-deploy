echo "Destroying containers"
docker rm -f laravel-cont mysql-cont

echo "Destroying network"
docker network rm test-laravel

echo "y" | docker volume prune