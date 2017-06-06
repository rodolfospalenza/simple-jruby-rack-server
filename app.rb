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
    { path: @request.path, params: @request.params }
    # or something like:
    # {
    #   response: 'ok!',
    # }
  end
end
