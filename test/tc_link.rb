$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))

require 'test/unit'
require 'duck_duck_go/link'
require 'duck_duck_go/icon'
require 'uri'

class TestLink < Test::Unit::TestCase
  
  def test_link
    data = {
      "Result" => "<a href=\"http://www.foo.com\"><b>Official site</b></a><a href=\"http://www.foo.com\"></a>",
      "Icon" => {
        "URL" => "https://i.duckduckgo.com/i/foo.com.ico",
        "Height" => 16,
        "Width" => 16
      },
      "FirstURL" => "http://www.foo.com",
      "Text" => "Official site"
    }
    
    link = DuckDuckGo::Link.by(data)
    assert_instance_of(DuckDuckGo::Link, link)
    assert_instance_of(DuckDuckGo::Icon, link.icon)
    assert_instance_of(URI::HTTP, link.first_url)
    assert_equal('www.foo.com', link.first_url.host)
    assert_equal('Official site', link.text)
  end
  
  def test_link_missing_icon
    data = {
      "Result" => "<a href=\"http://www.foo.com\"><b>Official site</b></a><a href=\"http://www.foo.com\"></a>",
      "Icon" => {
      },
      "FirstURL" => "http://www.foo.com",
      "Text" => "Official site"
    }
    
    link = DuckDuckGo::Link.by(data)
    assert_instance_of(DuckDuckGo::Link, link)
    assert_nil(link.icon)
    assert_instance_of(URI::HTTP, link.first_url)
    assert_equal('www.foo.com', link.first_url.host)
    assert_equal('Official site', link.text)
  end
end