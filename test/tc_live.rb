$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))

require 'test/unit'
require 'duck_duck_go'
require 'duck_duck_go/zero_click_info'

class TestLive < Test::Unit::TestCase
  
  # test a live search for 'stephen fry'
  def test_live
    
    ddg = DuckDuckGo.new(nil, false)
    zci = ddg.zci('stephen fry')
    
    assert_instance_of(DuckDuckGo::ZeroClickInfo, zci)
    assert_equal("Stephen Fry", zci.heading)
    assert_equal("Wikipedia", zci.abstract_source)
    assert_equal("A", zci.type)
  end
  
  # test using http
  def test_live_http
    
    ddg = DuckDuckGo.new(nil, true)
    zci = ddg.zci('stephen fry')
    
    assert_instance_of(DuckDuckGo::ZeroClickInfo, zci)
    assert_equal("Stephen Fry", zci.heading)
    assert_equal("Wikipedia", zci.abstract_source)
    assert_equal("A", zci.type)
  end
  
  # questions do not currently get a response on the api
  def test_answer
    ddg = DuckDuckGo.new
    zci = ddg.zci('age of obama')
    
    assert_nil(zci.abstract)
    assert_nil(zci.answer)
    assert_nil(zci.definition)
    assert_nil(zci.heading)
    assert_equal(0, zci.related_topics.size)
    assert_equal(0, zci.results.size)
  end
end