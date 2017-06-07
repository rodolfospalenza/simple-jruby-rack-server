require 'faye/websocket'

App = lambda do |env|
  if Faye::WebSocket.websocket?(env)
    ws = Faye::WebSocket.new(env)

    puts 'ASFA'

    ws.on(:open) do |event|
      puts 'On Open'
    end

    ws.on :message do |event|
      puts '12312321'#[:close, event.code, event.reason]
      ws.send(event.data)
    end

    ws.on :close do |event|
      puts 'afsdafsda'# [:close, event.code, event.reason]
      ws = nil
    end

    # Return async Rack response
    ws.rack_response

  else
    # Normal HTTP request
    [200, {'Content-Type' => 'text/plain'}, ['Hello']]
  end
end
