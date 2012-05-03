module DuckDuckGo
  
  require 'uri'
  require 'duck_duck_go/link'
  require 'duck_duck_go/icon'
  
  class DuckDuckGo::ZeroClickInfo
    
    # Definitions for the result type
    TYPE_DEFINITIONS = {
      'A' => 'article',
      'D' => 'disambiguation',
      'C' => 'category',
      'N' => 'name',
      'E' => 'exclusive',
    }
    
    attr_reader :abstract, :abstract_text, :abstract_source, :abstract_url, :image, :heading, :answer, :answer_type, :definition, :definition_source, :definition_url, :type, :type_long, :results, :related_topics
    
    # Representes a DDG Zero Click Info result
    def initialize(abstract = nil, abstract_text = nil, abstract_source = nil, abstract_url = nil, image = nil, heading = nil, answer = nil, answer_type = nil, definition = nil, definition_source = nil, definition_url = nil, type = nil, results = nil, related_topics = nil)
      @abstract = abstract
      @abstract_text = abstract_text
      @abstract_source = abstract_source
      @abstract_url = abstract_url
      @image = image
      @heading = heading
      @answer = answer
      @answer_type = answer_type
      @definition = definition
      @definition_source = definition_source
      @definition_url = definition_url
      @type = type unless type.nil?
      @type_long = TYPE_DEFINITIONS[type]
      @results = results
      @related_topics = related_topics
    end
    
    # Populate the DuckDuckGo::ZeroClickInfo from a result
    def self.by(result)
      
      abstract = result['Abstract'] unless result['Abstract'].empty?
      abstract_text = result['AbstractText'] unless result['AbstractText'].empty?
      abstract_source = result['AbstractSource'] unless result['AbstractSource'].empty?
      abstract_url = URI.parse(URI.escape(result['AbstractURL'])) unless result['AbstractURL'].empty?
      image = URI.parse(URI.escape(result['Image'])) unless result['Image'].empty?
      heading = result['Heading'] unless result['Heading'].empty?
      answer = result['Answer'] unless result['Answer'].empty?
      answer_type = result['AnswerType'] unless result['AnswerType'].empty?
      definition = result['Definition'] unless result['Definition'].empty?
      definition_source = result['DefinitionSource'] unless result['DefinitionSource'].empty?
      definition_url = URI.parse(URI.escape(result['DefinitionURL'])) unless result['DefinitionURL'].empty?
      type = result['Type'] unless result['Type'].empty?
      
      if result['Results']
        results = Array.new
        result['Results'].each do |link_result|
          results << DuckDuckGo::Link.by(link_result)
        end
      end
      
      if result['RelatedTopics']
        related_topics = Hash.new
        result['RelatedTopics'].each do |t|
          if t['Topics']
            topics = Array.new
            t['Topics'].each do |link_result|
              topics << DuckDuckGo::Link.by(link_result)
            end
            related_topics[t['Name']] = topics
          else
            related_topics['_'] = Array.new if related_topics['_'].nil?
            related_topics['_'] << DuckDuckGo::Link.by(t)
          end
        end
      end
      
      self.new(abstract, abstract_text, abstract_source, abstract_url, image, heading, answer, answer_type, definition, definition_source, definition_url, type, results, related_topics)
    end
  end
  
end
