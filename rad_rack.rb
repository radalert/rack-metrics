module RadRack

  # This is a Rack module. You can use this anywhere that supports rack. 
  # Once you have it wired in, set metrics via RadRack::RadMetrics.update("Metric name", 42.0)
  # These will then be exposed via /rad-metrics.json  
  #
  class RadMetrics

    @@metrics = {}    
    
    # Use any name, and the value can be any number. If there is a pattern to learn, Rad Alert will learn it.
    # These are point in time values of something. It could be a counter that continuously increases, it really doesn't matter. 
    # Values scaled to be > 1.0 work best, but most anything will work. 
    # 
    def self.update(name, val) 
        @@metrics[name] = val
    end
    
    def self.delete(name)
        @@metrics.delete(name)
    end

    def initialize(app)
      @app = app
    end

    def call(env)
      if (env['REQUEST_PATH'] == "/rad-metrics.json") then        
        [200, {}, [{"metrics" => @@metrics}.to_json]]
      else
        @app.call env
      end      
    end
  end

end
