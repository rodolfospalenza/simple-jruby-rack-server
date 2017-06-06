require 'json'

class App
  def self.call(env)
    new.call env
  end

  def call(env)
    @request = Rack::Request.new(@env = env)
    [ 200, {'Content-Type' => 'json'}, [ JSON.unparse(process) ]]
  end

  def process
    {
      response: 'ok!',
    }
  end
end
