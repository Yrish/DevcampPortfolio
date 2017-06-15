echo "IP: $IP"
echo "PORT: $PORT"


#ruby version
rvm use 2.4.0

rails db:create
rails db:migrate
rails s -b $IP -p $PORT
