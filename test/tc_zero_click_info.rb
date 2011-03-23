$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))

require 'test/unit'
require 'duck_duck_go/zero_click_info'
require 'uri'

class TestZCI < Test::Unit::TestCase
  
  def test_zci
    
    # example data - a search for Stephen Fry
    data = {"Definition"=>"", "DefinitionSource"=>"", "Heading"=>"Stephen Fry", "AbstractSource"=>"Wikipedia", "Image"=>"https://i.duckduckgo.com/i/72880df1.jpg", "RelatedTopics"=>[{"Result"=>"<a href=\"http://duckduckgo.com/Stephen_Fry_(cricketer)\">Stephen Fry (cricketer)</a> - Stephen Fry was an English cricketer.", "Icon"=>{}, "FirstURL"=>"http://duckduckgo.com/Stephen_Fry_(cricketer)", "Text"=>"Stephen Fry (cricketer) - Stephen Fry was an English cricketer."}, {"Result"=>"<a href=\"http://duckduckgo.com/c/English_podcasters\">English podcasters</a>", "Icon"=>{}, "FirstURL"=>"http://duckduckgo.com/c/English_podcasters", "Text"=>"English podcasters"}, {"Result"=>"<a href=\"http://duckduckgo.com/c/Rectors_of_the_University_of_Dundee\">Rectors of the University of Dundee</a>", "Icon"=>{}, "FirstURL"=>"http://duckduckgo.com/c/Rectors_of_the_University_of_Dundee", "Text"=>"Rectors of the University of Dundee"}, {"Result"=>"<a href=\"http://duckduckgo.com/c/Real_people_associated_with_the_Harry_Potter_books\">Real people associated with the Harry Potter books</a>", "Icon"=>{}, "FirstURL"=>"http://duckduckgo.com/c/Real_people_associated_with_the_Harry_Potter_books", "Text"=>"Real people associated with the Harry Potter books"}, {"Result"=>"<a href=\"http://duckduckgo.com/c/Sidewise_Award_winning_authors\">Sidewise Award winning authors</a>", "Icon"=>{}, "FirstURL"=>"http://duckduckgo.com/c/Sidewise_Award_winning_authors", "Text"=>"Sidewise Award winning authors"}, {"Result"=>"<a href=\"http://duckduckgo.com/c/British_actors_of_Hungarian_descent\">British actors of Hungarian descent</a>", "Icon"=>{}, "FirstURL"=>"http://duckduckgo.com/c/British_actors_of_Hungarian_descent", "Text"=>"British actors of Hungarian descent"}, {"Result"=>"<a href=\"http://duckduckgo.com/c/University_Challenge_contestants\">University Challenge contestants</a>", "Icon"=>{}, "FirstURL"=>"http://duckduckgo.com/c/University_Challenge_contestants", "Text"=>"University Challenge contestants"}, {"Result"=>"<a href=\"http://duckduckgo.com/c/English_radio_writers\">English radio writers</a>", "Icon"=>{}, "FirstURL"=>"http://duckduckgo.com/c/English_radio_writers", "Text"=>"English radio writers"}, {"Result"=>"<a href=\"http://duckduckgo.com/c/English_humanists\">English humanists</a>", "Icon"=>{}, "FirstURL"=>"http://duckduckgo.com/c/English_humanists", "Text"=>"English humanists"}, {"Result"=>"<a href=\"http://duckduckgo.com/c/English_game_show_hosts\">English game show hosts</a>", "Icon"=>{}, "FirstURL"=>"http://duckduckgo.com/c/English_game_show_hosts", "Text"=>"English game show hosts"}, {"Result"=>"<a href=\"http://duckduckgo.com/c/Alternate_history_writers\">Alternate history writers</a>", "Icon"=>{}, "FirstURL"=>"http://duckduckgo.com/c/Alternate_history_writers", "Text"=>"Alternate history writers"}, {"Result"=>"<a href=\"http://duckduckgo.com/c/People_associated_with_the_University_of_Dundee\">People associated with the University of Dundee</a>", "Icon"=>{}, "FirstURL"=>"http://duckduckgo.com/c/People_associated_with_the_University_of_Dundee", "Text"=>"People associated with the University of Dundee"}, {"Result"=>"<a href=\"http://duckduckgo.com/c/English_comedy_writers\">English comedy writers</a>", "Icon"=>{}, "FirstURL"=>"http://duckduckgo.com/c/English_comedy_writers", "Text"=>"English comedy writers"}, {"Result"=>"<a href=\"http://duckduckgo.com/c/Old_Uppinghamians\">Old Uppinghamians</a>", "Icon"=>{}, "FirstURL"=>"http://duckduckgo.com/c/Old_Uppinghamians", "Text"=>"Old Uppinghamians"}, {"Result"=>"<a href=\"http://duckduckgo.com/c/Audio_book_narrators\">Audio book narrators</a>", "Icon"=>{}, "FirstURL"=>"http://duckduckgo.com/c/Audio_book_narrators", "Text"=>"Audio book narrators"}, {"Result"=>"<a href=\"http://duckduckgo.com/c/People_from_Hampstead\">People from Hampstead</a>", "Icon"=>{}, "FirstURL"=>"http://duckduckgo.com/c/People_from_Hampstead", "Text"=>"People from Hampstead"}, {"Result"=>"<a href=\"http://duckduckgo.com/c/Atheism_activists\">Atheism activists</a>", "Icon"=>{}, "FirstURL"=>"http://duckduckgo.com/c/Atheism_activists", "Text"=>"Atheism activists"}, {"Result"=>"<a href=\"http://duckduckgo.com/c/LGBT_television_personalities\">LGBT television personalities</a>", "Icon"=>{}, "FirstURL"=>"http://duckduckgo.com/c/LGBT_television_personalities", "Text"=>"LGBT television personalities"}, {"Result"=>"<a href=\"http://duckduckgo.com/c/Outstanding_Performance_by_a_Cast_in_a_Motion_Picture_Screen_Actors_Guild_Award_winners\">Outstanding Performance by a Cast in a Motion Picture Screen Actors Guild Award winners</a>", "Icon"=>{}, "FirstURL"=>"http://duckduckgo.com/c/Outstanding_Performance_by_a_Cast_in_a_Motion_Picture_Screen_Actors_Guild_Award_winners", "Text"=>"Outstanding Performance by a Cast in a Motion Picture Screen Actors Guild Award winners"}, {"Result"=>"<a href=\"http://duckduckgo.com/c/Jewish_atheists\">Jewish atheists</a>", "Icon"=>{}, "FirstURL"=>"http://duckduckgo.com/c/Jewish_atheists", "Text"=>"Jewish atheists"}, {"Result"=>"<a href=\"http://duckduckgo.com/c/English_atheists\">English atheists</a>", "Icon"=>{}, "FirstURL"=>"http://duckduckgo.com/c/English_atheists", "Text"=>"English atheists"}, {"Result"=>"<a href=\"http://duckduckgo.com/c/Alumni_of_Queens'_College%2C_Cambridge\">Alumni of Queens' College, Cambridge</a>", "Icon"=>{}, "FirstURL"=>"http://duckduckgo.com/c/Alumni_of_Queens'_College%2C_Cambridge", "Text"=>"Alumni of Queens' College, Cambridge"}, {"Result"=>"<a href=\"http://duckduckgo.com/c/English_television_writers\">English television writers</a>", "Icon"=>{}, "FirstURL"=>"http://duckduckgo.com/c/English_television_writers", "Text"=>"English television writers"}, {"Result"=>"<a href=\"http://duckduckgo.com/c/People_with_bipolar_disorder\">People with bipolar disorder</a>", "Icon"=>{}, "FirstURL"=>"http://duckduckgo.com/c/People_with_bipolar_disorder", "Text"=>"People with bipolar disorder"}, {"Result"=>"<a href=\"http://duckduckgo.com/c/English_film_directors\">English film directors</a>", "Icon"=>{}, "FirstURL"=>"http://duckduckgo.com/c/English_film_directors", "Text"=>"English film directors"}, {"Result"=>"<a href=\"http://duckduckgo.com/c/English_comedians\">English comedians</a>", "Icon"=>{}, "FirstURL"=>"http://duckduckgo.com/c/English_comedians", "Text"=>"English comedians"}], "AbstractText"=>"Stephen John Fry (born 24 August 1957) is an English actor, screenwriter, author, playwright,  journalist, poet, comedian, television presenter and film director, and a director of Norwich City Football Club.", "Abstract"=>"Stephen John Fry (born 24 August 1957) is an English actor, screenwriter, author, playwright,  journalist, poet, comedian, television presenter and film director, and a director of Norwich City Football Club.", "AnswerType"=>"", "Type"=>"A", "DefinitionURL"=>"", "Answer"=>"", "Results"=>[{"Result"=>"<a href=\"http://www.stephenfry.com\"><b>Official site</b></a><a href=\"http://www.stephenfry.com\"></a>", "Icon"=>{"URL"=>"https://i.duckduckgo.com/i/stephenfry.com.ico", "Height"=>16, "Width"=>16}, "FirstURL"=>"http://www.stephenfry.com", "Text"=>"Official site"}, {"Result"=>"<a href=\"http://news.bbc.co.uk/1/hi/entertainment/7895351.stm\">Five Minutes With: Stephen Fry</a><a href=\"http://news.bbc.co.uk/1/hi/entertainment/7895351.stm\">, interview with Matthew Stadlen for the BBC</a>", "Icon"=>{"URL"=>"https://i.duckduckgo.com/i/news.bbc.co.uk.ico", "Height"=>16, "Width"=>16}, "FirstURL"=>"http://news.bbc.co.uk/1/hi/entertainment/7895351.stm", "Text"=>"Five Minutes With: Stephen Fry, interview with Matthew Stadlen for the BBC"}], "AbstractURL"=>"https://secure.wikimedia.org/wikipedia/en/wiki/Stephen_Fry"}
    
    
    zci = DuckDuckGo::ZeroClickInfo.by(data)
    
    assert_equal("Stephen Fry", zci.heading)
    assert_equal("Wikipedia", zci.abstract_source)
    assert_instance_of(URI::HTTPS, zci.image)
    assert_equal('i.duckduckgo.com', zci.image.host)
    assert_equal("Stephen John Fry (born 24 August 1957) is an English actor, screenwriter, author, playwright,  journalist, poet, comedian, television presenter and film director, and a director of Norwich City Football Club.", zci.abstract_text)
    assert_equal("Stephen John Fry (born 24 August 1957) is an English actor, screenwriter, author, playwright,  journalist, poet, comedian, television presenter and film director, and a director of Norwich City Football Club.", zci.abstract)
    assert_nil(zci.answer_type)
    assert_equal("article", zci.type)
    assert_nil(zci.definition_url)
    assert_nil(zci.answer)
    assert_instance_of(URI::HTTPS, zci.abstract_url)
    assert_equal('secure.wikimedia.org', zci.abstract_url.host)
    assert_equal(2, zci.results.size)
    assert_equal("Official site", zci.results[0].text)
    assert_equal(26, zci.related_topics.size)
    assert_equal("Stephen Fry (cricketer) - Stephen Fry was an English cricketer.", zci.related_topics[0].text)
  end
end
