#hello_world.rb

require_relative 'advice' # loads advice.rb
require 'erb'

class HelloWorld
  def call(env)
    case env['REQUEST_PATH']
    when '/'
      template = File.read("views/index.erb")
      content = ERB.new(template)
      ['200', {'Content-Type' => 'text/html'}, [content.result]]
    when '/advice'
      piece_of_advice = Advice.new.generate # random piece of advice
      ['200', {'Content-Type' => 'text/html'}, ["<html><body><b><em>#{piece_of_advice}</em></body></html>"]]
    else
      ['404', {'Content-Type' => 'text/html'}, ["<html><body><h4>404 Not Found</h4></body></html>"]]
    end
  end
end