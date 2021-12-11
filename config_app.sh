echo "This script will configure the variables of the app according to user input."

ROOT_DIR=$(cd `dirname "$0"` && pwd)

read -p "1. Docker network name [default laravel_network]: " DOCKER_NETWORK
DOCKER_NETWORK=${DOCKER_NETWORK:-laravel_network}

read -p "2. Laravel app container name [default laravel_container]: " LARAVEL_CONTAINER
LARAVEL_CONTAINER=${LARAVEL_CONTAINER:-laravel_container}

read -p "3. MySQL container name [default mysql_container]: " MYSQL_CONTAINER
MYSQL_CONTAINER=${MYSQL_CONTAINER:-mysql_container}

read -p "4. Laravel published port [default 1234]: " LARAVEL_PORT
LARAVEL_PORT=${LARAVEL_PORT:-1234}

read -p "5. MySQL published port [default 2345]: " MYSQL_PORT
MYSQL_PORT=${MYSQL_PORT:-2345}

read -p "6. MySQL database name [default dummydashboard]: " MYSQL_DATABASE
MYSQL_DATABASE=${MYSQL_DATABASE:-dummydashboard}

read -sp "7. MySQL root password [default example]: " MYSQL_ROOT_PASSWORD
MYSQL_ROOT_PASSWORD=${MYSQL_ROOT_PASSWORD:-example}

echo "" #Newline for aestethic purposes

#Configuring run_app.sh script
sed -i "s|DOCKER_NETWORK=.*|DOCKER_NETWORK=${DOCKER_NETWORK}|" $ROOT_DIR/run_app.sh
sed -i "s|LARAVEL_CONTAINER=.*|LARAVEL_CONTAINER=${LARAVEL_CONTAINER}|" $ROOT_DIR/run_app.sh
sed -i "s|LARAVEL_PORT=.*|LARAVEL_PORT=${LARAVEL_PORT}|" $ROOT_DIR/run_app.sh
sed -i "s|MYSQL_CONTAINER=.*|MYSQL_CONTAINER=${MYSQL_CONTAINER}|" $ROOT_DIR/run_app.sh
sed -i "s|MYSQL_PORT=.*|MYSQL_PORT=${MYSQL_PORT}|" $ROOT_DIR/run_app.sh

#Configuring destroy_app.sh script
sed -i "s|docker rm -f .* .*|docker rm -f ${LARAVEL_CONTAINER} ${MYSQL_CONTAINER}|" $ROOT_DIR/destroy_app.sh
sed -i "s|docker network rm .*|docker network rm ${DOCKER_NETWORK}|" $ROOT_DIR/destroy_app.sh

#Configuring Laravel environment file (laravel-container/.env.laravel)
echo "DB_CONNECTION=
DB_HOST=
DB_PORT=
DB_USERNAME=
DB_PASSWORD=
DB_DATABASE=" > $ROOT_DIR/laravel-container/.env.laravel
sed -i "s|DB_CONNECTION=.*|DB_CONNECTION=mysql|" $ROOT_DIR/laravel-container/.env.laravel
sed -i "s|DB_HOST=.*|DB_HOST=${MYSQL_CONTAINER}|" $ROOT_DIR/laravel-container/.env.laravel
sed -i "s|DB_PORT=.*|DB_PORT=3306|" $ROOT_DIR/laravel-container/.env.laravel
sed -i "s|DB_USERNAME=.*|DB_USERNAME=root|" $ROOT_DIR/laravel-container/.env.laravel
sed -i "s|DB_PASSWORD=.*|DB_PASSWORD=${MYSQL_ROOT_PASSWORD}|" $ROOT_DIR/laravel-container/.env.laravel
sed -i "s|DB_DATABASE=.*|DB_DATABASE=${MYSQL_DATABASE}|" $ROOT_DIR/laravel-container/.env.laravel

#Configuring MySQL environment file (mysql-container/.env.mysql)
echo "MYSQL_HOST=
MYSQL_ROOT_PASSWORD=
MYSQL_DATABASE=" > $ROOT_DIR/mysql-container/.env.mysql
sed -i "s|MYSQL_HOST=.*|MYSQL_HOST=${MYSQL_CONTAINER}|" $ROOT_DIR/mysql-container/.env.mysql
sed -i "s|MYSQL_ROOT_PASSWORD=.*|MYSQL_ROOT_PASSWORD=${MYSQL_ROOT_PASSWORD}|" $ROOT_DIR/mysql-container/.env.mysql
sed -i "s|MYSQL_DATABASE=.*|MYSQL_DATABASE=${MYSQL_DATABASE}|" $ROOT_DIR/mysql-container/.env.mysql