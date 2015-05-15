# Rack support for Rad Alert metrics collection

Rad Alert can collect metrics exposed via http, and this rack module makes it easy to add it to your app. 

## To use

* Add rad_rack.rb to your project
* enable the RadRack module, eg `use RadRack::RadMetrics` in Sinatra (see also http://karmi.tumblr.com/post/663716963/rack-middleware-examples)
* Put metrics in there to be collected via: `RadRack::RadMetrics.update("Temperature", 42.0)`
* Metrics will be exposed via http://yourapp/rad-metrics.json


## Sample app

Run `ruby sample_app.rb` to see this in action. 
