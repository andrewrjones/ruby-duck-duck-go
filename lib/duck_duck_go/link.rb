module DuckDuckGo
  
  require 'uri'
  require 'duck_duck_go/icon'
  
  class DuckDuckGo::Link
    
    attr_reader :result, :first_url, :icon, :text
    
    # Representes a DDG link
    def initialize(result = nil, first_url = nil, icon = nil, text = nil)
      @result = result
      @first_url = first_url
      @icon = icon
      @text = text
    end
    
    # Populate a DuckDuckGo::Link from a result
    def self.by(link_result)
      result = link_result['Result'] unless link_result['Result'].empty?
      first_url = URI.parse(link_result['FirstURL']) unless link_result['FirstURL'].empty?
      icon = DuckDuckGo::Icon.by(link_result['Icon']) unless link_result['Icon'].empty?
      text = link_result['Text'] unless link_result['Text'].empty?
      
      self.new(result, first_url, icon, text)
    end
  end
  
end