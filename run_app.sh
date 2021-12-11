export ROOT_DIR=$(cd `dirname "$0"` && pwd)
export DOCKER_NETWORK=laravel_network
export LARAVEL_CONTAINER=laravel_container
export LARAVEL_PORT=1234
export MYSQL_CONTAINER=mysql_container
export MYSQL_PORT=2345

echo "Creating docker network"
docker network create $DOCKER_NETWORK

echo "Starting MySQL container"
$ROOT_DIR/mysql-container/run_mysql.sh

echo "Starting Laravel container"
$ROOT_DIR/laravel-container/run_laravel.sh