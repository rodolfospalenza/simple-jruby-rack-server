require 'rack'
require 'puma'
require_relative '../app'

app = Rack::Builder.app do
  use Rack::Reloader, 0 unless ENV['APP_ENV'] == 'production'
  use Rack::ContentLength

  run App
end

server = Puma::Server.new(app)
host = ENV['BIND_HOST'] || 'localhost'
port = ENV['APP_PORT'] || 1234
server.add_tcp_listener host, port
thread = server.run
puts "Running on http://#{host}:#{port} (set BIND_HOST and APP_PORT to override)"
Signal.trap('INT'){ server.stop }
thread.join
