# myapp.rb
#require 'sinatra'
#
#get '/' do
#  'Hello world!'
#end
require 'rubygems'
require 'sinatra'

module Rack

  # Put response time information into the response body
  # See also http://github.com/ryanb/railscasts-episodes/blob/master/episode-151/store/lib/response_timer.rb
  #
  class RadMetrics

    def initialize(app)
      @app = app
    end

    def call(env)
      if (env['REQUEST_PATH'] == "/rad-metrics.json") then
        [200, {}, ["yeah"]]
      else
        @app.call env
      end
      
    end

  end


end

# Try to swap the `use ...` lines
use Rack::RadMetrics

get '/' do
  "Hello, World!"  # ...response
end
