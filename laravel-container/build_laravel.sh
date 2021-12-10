#cd $ROOT_DIR/laravel-container && 

rm -Rf dummydashboard
git clone https://github.com/fajrikornel/dummydashboard.git
docker image build --tag dockerlaraveldeploy:latest .
