# Simple standalone JRuby Rack app packaged with warble

Create jar:

    binstubs/warble

Run it with `bin/start` (change the port in that script) or:

    BIND_HOST=localhost APP_PORT=3000 APP_ENV=production java -jar simple-jruby-rack-server.jar run.rb
