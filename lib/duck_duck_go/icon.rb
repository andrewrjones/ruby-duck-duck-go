module DuckDuckGo
  
  require 'uri'
  
  class DuckDuckGo::Icon
    
    attr_reader :url, :width, :height
    
    # Representes a DDG icon
    def initialize(url = nil, width = nil, height = nil)
      @url = url
      @width = width
      @height = height
    end
    
    # Populate an DuckDuckGo::Icon from a result
    def self.by(icon_result)
      url = URI.parse(icon_result['URL']) unless icon_result['URL'].empty?
      width = icon_result['Width'] if icon_result['Width']
      height = icon_result['Height'] if icon_result['Height']
      
      self.new(url, width, height)
    end
  end
  
end