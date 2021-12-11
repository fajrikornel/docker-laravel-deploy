echo "Destroying containers"
docker rm -f laravel_container mysql_container

echo "Destroying network"
docker network rm laravel_network

echo "y" | docker volume prune