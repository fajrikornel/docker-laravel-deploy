export ROOT_DIR=$(cd `dirname "$0"` && pwd)
export NETWORK=test-laravel

echo "Creating docker network"
docker network create $NETWORK

echo "Starting MySQL container"
$ROOT_DIR/mysql-container/run_mysql.sh

echo "Starting Laravel container"
$ROOT_DIR/laravel-container/run_laravel.sh