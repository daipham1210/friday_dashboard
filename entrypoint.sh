rm -f /tmp/pids/server.pid 
bundle exec rails s -p 3000
exec "$@"
