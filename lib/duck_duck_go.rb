# Author: Andrew Jones <http://andrew-jones.com>
# The license of this source is MIT Licence

module DuckDuckGo
  
  require 'rubygems'
  require 'uri'
  require 'httpclient'
  require 'json'
  require 'duck_duck_go/zero_click_info'

  # see DuckDuckGo::Main.new
  def self.new(*params)
    DuckDuckGo::Main.new(*params)
  end
  
  class Main
    
    API_URL = 'http://api.duckduckgo.com/'
    API_URL_SECURE = 'https://api.duckduckgo.com/'
    
    # Create a new instance.
    # It is recommended to pass in a meaningful user agent.
    # Defaults to using the secure api (https)
    def initialize(http_agent_name = 'DuckDuckGo.rb', secure = true)
      if secure
        @url = API_URL_SECURE
      else
        @url = API_URL
      end
      @http = HTTPClient.new(:agent_name => http_agent_name)
    end
    
    # Run a query against Duck Duck Go
    # Returns an instance of DuckDuckGo::ZeroClickInfo
    def zeroclickinfo(query, skip_disambiguation = false)
      args = {
        'q' => query,
        'o' => 'json'
      }
      if(skip_disambiguation)
        args['d'] = 1
      end
      
      data = @http.get_content(@url, args)
  
      # parse the JSON and return an instance
      # of the ZeroClickInfo class
      DuckDuckGo::ZeroClickInfo.by(JSON.parse(data))
    end
  
    # Alias for DuckDuckGo::Main.zeroclickinfo
    def zci(*params)
      self.zeroclickinfo(*params)
    end
  end
  
end