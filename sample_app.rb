# This simple app shows how to use Rack middle ware to expose metrics for Rad Alert to consume. 
# Sinatra is used, but you could also use it with rails, see http://karmi.tumblr.com/post/663716963/rack-middleware-examples 
#
require 'rubygems'
require 'sinatra'
require 'json'
require_relative 'rad_rack'



# Use the rack middleware - this publishes metrics via /rad-metrics.json. 
# So you can tell Rad Alert to monitor http://yourapp.com/rad-metrics.json 
use RadRack::RadMetrics


get '/' do
  # set some metric values
  RadRack::RadMetrics.update("Temperature", 42.0)
  RadRack::RadMetrics.update("Bacon eaten", 6)
  "Hello, World!"  
end
