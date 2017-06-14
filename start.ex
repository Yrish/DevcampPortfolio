echo "IP: $IP"
echo "PORT: $PORT"

rails db:create
rails db:migrate
rails s -b $IP -p $PORT
