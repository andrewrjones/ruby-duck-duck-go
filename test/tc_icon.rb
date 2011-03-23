$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))

require 'test/unit'
require 'duck_duck_go/icon'
require 'uri'

class TestIcon < Test::Unit::TestCase
  
  def test_icon
    data = {
      "URL" => "https://i.duckduckgo.com/i/foo.com.ico",
      "Height" => 16,
      "Width" => 16
    }
    
    icon = DuckDuckGo::Icon.by(data)
    assert_instance_of(DuckDuckGo::Icon, icon)
    assert_instance_of(URI::HTTPS, icon.url)
    assert_equal("i.duckduckgo.com", icon.url.host)
    assert_equal(16, icon.width)
    assert_equal(16, icon.height)
  end
end