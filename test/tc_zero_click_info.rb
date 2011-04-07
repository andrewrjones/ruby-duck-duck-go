$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))

require 'test/unit'
require 'duck_duck_go/zero_click_info'
require 'uri'

class TestZCI < Test::Unit::TestCase
  
  def test_zci_article
    
    # example data - a search for Stephen Fry
    data = {"AbstractSource"=>"Wikipedia",
 "Answer"=>"",
 "Definition"=>"",
 "Results"=>
  [{"Text"=>"Official site",
    "Icon"=>
     {"URL"=>"http://i.duck.co/i/stephenfry.com.ico",
      "Width"=>16,
      "Height"=>16},
    "Result"=>
     "<a href=\"http://www.stephenfry.com\"><b>Official site</b></a><a href=\"http://www.stephenfry.com\"></a>",
    "FirstURL"=>"http://www.stephenfry.com"},
   {"Text"=>
     "Five Minutes With: Stephen Fry, interview with Matthew Stadlen for the BBC",
    "Icon"=>
     {"URL"=>"http://i.duck.co/i/news.bbc.co.uk.ico",
      "Width"=>16,
      "Height"=>16},
    "Result"=>
     "<a href=\"http://news.bbc.co.uk/1/hi/entertainment/7895351.stm\">Five Minutes With: Stephen Fry</a><a href=\"http://news.bbc.co.uk/1/hi/entertainment/7895351.stm\">, interview with Matthew Stadlen for the BBC</a>",
    "FirstURL"=>"http://news.bbc.co.uk/1/hi/entertainment/7895351.stm"}],
 "AnswerType"=>"",
 "Abstract"=>
  "Stephen John Fry is an English actor, screenwriter, author, playwright,  journalist, poet, comedian, television presenter and film director, and a director of Norwich City Football Club.",
 "Heading"=>"Stephen Fry",
 "RelatedTopics"=>
  [{"Text"=>"Stephen Fry (cricketer) - Stephen Fry was an English cricketer.",
    "Icon"=>{},
    "Result"=>
     "<a href=\"http://duckduckgo.com/Stephen_Fry_(cricketer)\">Stephen Fry (cricketer)</a> - Stephen Fry was an English cricketer.",
    "FirstURL"=>"http://duckduckgo.com/Stephen_Fry_(cricketer)"},
   {"Text"=>"English podcasters",
    "Icon"=>{},
    "Result"=>
     "<a href=\"http://duckduckgo.com/c/English_podcasters\">English podcasters</a>",
    "FirstURL"=>"http://duckduckgo.com/c/English_podcasters"},
   {"Text"=>"Rectors of the University of Dundee",
    "Icon"=>{},
    "Result"=>
     "<a href=\"http://duckduckgo.com/c/Rectors_of_the_University_of_Dundee\">Rectors of the University of Dundee</a>",
    "FirstURL"=>"http://duckduckgo.com/c/Rectors_of_the_University_of_Dundee"},
   {"Text"=>"Real people associated with the Harry Potter books",
    "Icon"=>{},
    "Result"=>
     "<a href=\"http://duckduckgo.com/c/Real_people_associated_with_the_Harry_Potter_books\">Real people associated with the Harry Potter books</a>",
    "FirstURL"=>
     "http://duckduckgo.com/c/Real_people_associated_with_the_Harry_Potter_books"},
   {"Text"=>"Sidewise Award winning authors",
    "Icon"=>{},
    "Result"=>
     "<a href=\"http://duckduckgo.com/c/Sidewise_Award_winning_authors\">Sidewise Award winning authors</a>",
    "FirstURL"=>"http://duckduckgo.com/c/Sidewise_Award_winning_authors"},
   {"Text"=>"British actors of Hungarian descent",
    "Icon"=>{},
    "Result"=>
     "<a href=\"http://duckduckgo.com/c/British_actors_of_Hungarian_descent\">British actors of Hungarian descent</a>",
    "FirstURL"=>"http://duckduckgo.com/c/British_actors_of_Hungarian_descent"},
   {"Text"=>"University Challenge contestants",
    "Icon"=>{},
    "Result"=>
     "<a href=\"http://duckduckgo.com/c/University_Challenge_contestants\">University Challenge contestants</a>",
    "FirstURL"=>"http://duckduckgo.com/c/University_Challenge_contestants"},
   {"Text"=>"English radio writers",
    "Icon"=>{},
    "Result"=>
     "<a href=\"http://duckduckgo.com/c/English_radio_writers\">English radio writers</a>",
    "FirstURL"=>"http://duckduckgo.com/c/English_radio_writers"},
   {"Text"=>"English humanists",
    "Icon"=>{},
    "Result"=>
     "<a href=\"http://duckduckgo.com/c/English_humanists\">English humanists</a>",
    "FirstURL"=>"http://duckduckgo.com/c/English_humanists"},
   {"Text"=>"English game show hosts",
    "Icon"=>{},
    "Result"=>
     "<a href=\"http://duckduckgo.com/c/English_game_show_hosts\">English game show hosts</a>",
    "FirstURL"=>"http://duckduckgo.com/c/English_game_show_hosts"},
   {"Text"=>"Alternate history writers",
    "Icon"=>{},
    "Result"=>
     "<a href=\"http://duckduckgo.com/c/Alternate_history_writers\">Alternate history writers</a>",
    "FirstURL"=>"http://duckduckgo.com/c/Alternate_history_writers"},
   {"Text"=>"People associated with the University of Dundee",
    "Icon"=>{},
    "Result"=>
     "<a href=\"http://duckduckgo.com/c/People_associated_with_the_University_of_Dundee\">People associated with the University of Dundee</a>",
    "FirstURL"=>
     "http://duckduckgo.com/c/People_associated_with_the_University_of_Dundee"},
   {"Text"=>"English comedy writers",
    "Icon"=>{},
    "Result"=>
     "<a href=\"http://duckduckgo.com/c/English_comedy_writers\">English comedy writers</a>",
    "FirstURL"=>"http://duckduckgo.com/c/English_comedy_writers"},
   {"Text"=>"Old Uppinghamians",
    "Icon"=>{},
    "Result"=>
     "<a href=\"http://duckduckgo.com/c/Old_Uppinghamians\">Old Uppinghamians</a>",
    "FirstURL"=>"http://duckduckgo.com/c/Old_Uppinghamians"},
   {"Text"=>"Audio book narrators",
    "Icon"=>{},
    "Result"=>
     "<a href=\"http://duckduckgo.com/c/Audio_book_narrators\">Audio book narrators</a>",
    "FirstURL"=>"http://duckduckgo.com/c/Audio_book_narrators"},
   {"Text"=>"People from Hampstead",
    "Icon"=>{},
    "Result"=>
     "<a href=\"http://duckduckgo.com/c/People_from_Hampstead\">People from Hampstead</a>",
    "FirstURL"=>"http://duckduckgo.com/c/People_from_Hampstead"},
   {"Text"=>"Atheism activists",
    "Icon"=>{},
    "Result"=>
     "<a href=\"http://duckduckgo.com/c/Atheism_activists\">Atheism activists</a>",
    "FirstURL"=>"http://duckduckgo.com/c/Atheism_activists"},
   {"Text"=>"LGBT television personalities",
    "Icon"=>{},
    "Result"=>
     "<a href=\"http://duckduckgo.com/c/LGBT_television_personalities\">LGBT television personalities</a>",
    "FirstURL"=>"http://duckduckgo.com/c/LGBT_television_personalities"},
   {"Text"=>
     "Outstanding Performance by a Cast in a Motion Picture Screen Actors Guild Award winners",
    "Icon"=>{},
    "Result"=>
     "<a href=\"http://duckduckgo.com/c/Outstanding_Performance_by_a_Cast_in_a_Motion_Picture_Screen_Actors_Guild_Award_winners\">Outstanding Performance by a Cast in a Motion Picture Screen Actors Guild Award winners</a>",
    "FirstURL"=>
     "http://duckduckgo.com/c/Outstanding_Performance_by_a_Cast_in_a_Motion_Picture_Screen_Actors_Guild_Award_winners"},
   {"Text"=>"Jewish atheists",
    "Icon"=>{},
    "Result"=>
     "<a href=\"http://duckduckgo.com/c/Jewish_atheists\">Jewish atheists</a>",
    "FirstURL"=>"http://duckduckgo.com/c/Jewish_atheists"},
   {"Text"=>"English atheists",
    "Icon"=>{},
    "Result"=>
     "<a href=\"http://duckduckgo.com/c/English_atheists\">English atheists</a>",
    "FirstURL"=>"http://duckduckgo.com/c/English_atheists"},
   {"Text"=>"Alumni of Queens' College, Cambridge",
    "Icon"=>{},
    "Result"=>
     "<a href=\"http://duckduckgo.com/c/Alumni_of_Queens'_College%2C_Cambridge\">Alumni of Queens' College, Cambridge</a>",
    "FirstURL"=>
     "http://duckduckgo.com/c/Alumni_of_Queens'_College%2C_Cambridge"},
   {"Text"=>"English television writers",
    "Icon"=>{},
    "Result"=>
     "<a href=\"http://duckduckgo.com/c/English_television_writers\">English television writers</a>",
    "FirstURL"=>"http://duckduckgo.com/c/English_television_writers"},
   {"Text"=>"People with bipolar disorder",
    "Icon"=>{},
    "Result"=>
     "<a href=\"http://duckduckgo.com/c/People_with_bipolar_disorder\">People with bipolar disorder</a>",
    "FirstURL"=>"http://duckduckgo.com/c/People_with_bipolar_disorder"},
   {"Text"=>"English film directors",
    "Icon"=>{},
    "Result"=>
     "<a href=\"http://duckduckgo.com/c/English_film_directors\">English film directors</a>",
    "FirstURL"=>"http://duckduckgo.com/c/English_film_directors"},
   {"Text"=>"English comedians",
    "Icon"=>{},
    "Result"=>
     "<a href=\"http://duckduckgo.com/c/English_comedians\">English comedians</a>",
    "FirstURL"=>"http://duckduckgo.com/c/English_comedians"}],
 "AbstractURL"=>"http://en.wikipedia.org/wiki/Stephen_Fry",
 "Image"=>"http://i.duck.co/i/72880df1.jpg",
 "DefinitionURL"=>"",
 "DefinitionSource"=>"",
 "AbstractText"=>
  "Stephen John Fry is an English actor, screenwriter, author, playwright,  journalist, poet, comedian, television presenter and film director, and a director of Norwich City Football Club.",
 "Type"=>"A"}
    
    
    zci = DuckDuckGo::ZeroClickInfo.by(data)
    
    assert_equal("Stephen Fry", zci.heading)
    assert_equal("Wikipedia", zci.abstract_source)
    assert_instance_of(URI::HTTP, zci.image)
    assert_equal('i.duck.co', zci.image.host)
    assert_equal("Stephen John Fry is an English actor, screenwriter, author, playwright,  journalist, poet, comedian, television presenter and film director, and a director of Norwich City Football Club.", zci.abstract_text)
    assert_equal("Stephen John Fry is an English actor, screenwriter, author, playwright,  journalist, poet, comedian, television presenter and film director, and a director of Norwich City Football Club.", zci.abstract)
    assert_nil(zci.answer_type)
    assert_equal("A", zci.type)
    assert_equal("article", zci.type_long)
    assert_nil(zci.definition_url)
    assert_nil(zci.answer)
    assert_instance_of(URI::HTTP, zci.abstract_url)
    assert_equal('en.wikipedia.org', zci.abstract_url.host)
    assert_equal(2, zci.results.size)
    assert_equal("Official site", zci.results[0].text)
    assert_equal(1, zci.related_topics.size)
    assert_equal(26, zci.related_topics["_"].size)
    assert_equal("Stephen Fry (cricketer) - Stephen Fry was an English cricketer.", zci.related_topics["_"][0].text)
  end
  
  def test_zci_disambiguation
    
    data = {"AbstractSource"=>"Wikipedia",
 "Answer"=>"",
 "Definition"=>
  "A deciduous Eurasian tree having alternate simple leaves and white or pink flowers.",
 "Results"=>[],
 "AnswerType"=>"",
 "Abstract"=>"",
 "Heading"=>"Apple",
 "RelatedTopics"=>
  [{"Text"=>"The apple is a tree and its pomaceous fruit.",
    "Icon"=>{"URL"=>"http://i.duck.co/i/b5c79bb9.jpg"},
    "Result"=>
     "The <a href=\"http://duckduckgo.com/apple\">apple</a> is a tree and its pomaceous fruit.",
    "FirstURL"=>"http://duckduckgo.com/apple"},
   {"Name"=>"Companies",
    "Topics"=>
     [{"Text"=>"Apple Inc., a consumer electronics and software company",
       "Icon"=>{"URL"=>"http://i.duck.co/i/794fb31f.png"},
       "Result"=>
        "<a href=\"http://duckduckgo.com/Apple_Inc.\">Apple Inc.</a>, a consumer electronics and software company",
       "FirstURL"=>"http://duckduckgo.com/Apple_Inc."},
      {"Text"=>"Apple Corps, a multimedia corporation founded by The Beatles",
       "Icon"=>{"URL"=>"http://i.duck.co/i/9e15faeb.jpg"},
       "Result"=>
        "<a href=\"http://duckduckgo.com/Apple_Corps\">Apple Corps</a>, a multimedia corporation founded by The Beatles",
       "FirstURL"=>"http://duckduckgo.com/Apple_Corps"}]},
   {"Name"=>"Films",
    "Topics"=>
     [{"Text"=>"The Apple (1980 film), a 1980 musical science fiction film",
       "Icon"=>{"URL"=>"http://i.duck.co/i/ca3778cb.jpg"},
       "Result"=>
        "<a href=\"http://duckduckgo.com/The_Apple_(1980_film)\"><i>The Apple</i> (1980 film)</a>, a 1980 musical science fiction film",
       "FirstURL"=>"http://duckduckgo.com/The_Apple_(1980_film)"},
      {"Text"=>"The Apple (1998 film), by Samira Makhmalbaf",
       "Icon"=>{"URL"=>"http://i.duck.co/i/51c5a500.jpg"},
       "Result"=>
        "<a href=\"http://duckduckgo.com/The_Apple_(1998_film)\"><i>The Apple</i> (1998 film)</a>, by Samira Makhmalbaf",
       "FirstURL"=>"http://duckduckgo.com/The_Apple_(1998_film)"}]},
   {"Name"=>"Television",
    "Topics"=>
     [{"Text"=>
        "\"The Apple\" (Star Trek: The Original Series), a second season episode",
       "Icon"=>{"URL"=>"http://i.duck.co/i/7fc88794.jpg"},
       "Result"=>
        "<a href=\"http://duckduckgo.com/The_Apple_(Star_Trek%3A_The_Original_Series)\">\"The Apple\" (<i>Star Trek: The Original Series</i>)</a>, a second season episode",
       "FirstURL"=>
        "http://duckduckgo.com/The_Apple_(Star_Trek%3A_The_Original_Series)"}]},
   {"Name"=>"Music",
    "Topics"=>
     [{"Text"=>"Apple (album), an album by Mother Love Bone",
       "Icon"=>{"URL"=>"http://i.duck.co/i/9ca01bdb.jpg"},
       "Result"=>
        "<a href=\"http://duckduckgo.com/Apple_(album)\"><i>Apple</i> (album)</a>, an album by Mother Love Bone",
       "FirstURL"=>"http://duckduckgo.com/Apple_(album)"},
      {"Text"=>"Apple (band), a British psychedelic rock band",
       "Icon"=>{},
       "Result"=>
        "<a href=\"http://duckduckgo.com/Apple_(band)\">Apple (band)</a>, a British psychedelic rock band",
       "FirstURL"=>"http://duckduckgo.com/Apple_(band)"},
      {"Text"=>"The Apples, an early 90s Scottish indie-dance band",
       "Icon"=>{},
       "Result"=>
        "<a href=\"http://duckduckgo.com/The_Apples\">The Apples</a>, an early 90s Scottish indie-dance band",
       "FirstURL"=>"http://duckduckgo.com/The_Apples"},
      {"Text"=>"The Apples (Israeli), a mid 2000s Israeli funk band",
       "Icon"=>{},
       "Result"=>
        "<a href=\"http://duckduckgo.com/The_Apples_(Israeli)\">The Apples (Israeli)</a>, a mid 2000s Israeli funk band",
       "FirstURL"=>"http://duckduckgo.com/The_Apples_(Israeli)"},
      {"Text"=>"Apple Records, record label founded by The Beatles",
       "Icon"=>{"URL"=>"http://i.duck.co/i/9e15faeb.jpg"},
       "Result"=>
        "<a href=\"http://duckduckgo.com/Apple_Records\">Apple Records</a>, record label founded by The Beatles",
       "FirstURL"=>"http://duckduckgo.com/Apple_Records"}]},
   {"Name"=>"People",
    "Topics"=>
     [{"Text"=>
        "Apple Martin, the daughter of Gwyneth Paltrow and Chris Martin",
       "Icon"=>{"URL"=>"http://i.duck.co/i/f762256a.jpg"},
       "Result"=>
        "Apple Martin, the daughter of <a href=\"http://duckduckgo.com/Gwyneth_Paltrow\">Gwyneth Paltrow</a> and <a href=\"http://duckduckgo.com/?q=Chris Martin\">Chris Martin</a>",
       "FirstURL"=>"http://duckduckgo.com/Gwyneth_Paltrow"},
      {"Text"=>"Billy Apple, artist",
       "Icon"=>{},
       "Result"=>
        "<a href=\"http://duckduckgo.com/Billy_Apple\">Billy Apple</a>, artist",
       "FirstURL"=>"http://duckduckgo.com/Billy_Apple"},
      {"Text"=>
        "Fiona Apple, a Grammy award winning American singer-songwriter",
       "Icon"=>{"URL"=>"http://i.duck.co/i/f5f38669.jpg"},
       "Result"=>
        "<a href=\"http://duckduckgo.com/Fiona_Apple\">Fiona Apple</a>, a Grammy award winning American singer-songwriter",
       "FirstURL"=>"http://duckduckgo.com/Fiona_Apple"},
      {"Text"=>"Raymond Apple (rabbi), from Australia",
       "Icon"=>{},
       "Result"=>
        "<a href=\"http://duckduckgo.com/Raymond_Apple_(rabbi)\">Raymond Apple (rabbi)</a>, from Australia",
       "FirstURL"=>"http://duckduckgo.com/Raymond_Apple_(rabbi)"},
      {"Text"=>
        "Constance M. K. Applebee (1873\342\200\2231981), athlete, known as \"The Apple\"",
       "Icon"=>{},
       "Result"=>
        "<a href=\"http://duckduckgo.com/Constance_M._K._Applebee\">Constance M. K. Applebee</a> (1873\342\200\2231981), athlete, known as \"The Apple\"",
       "FirstURL"=>"http://duckduckgo.com/Constance_M._K._Applebee"}]},
   {"Name"=>"Places",
    "Topics"=>
     [{"Text"=>"Apple River Meanings",
       "Icon"=>{},
       "Result"=>
        "<a href=\"http://duckduckgo.com/d/Apple_River\">Apple River Meanings</a>",
       "FirstURL"=>"http://duckduckgo.com/d/Apple_River"},
      {"Text"=>"Apple Valley Meanings",
       "Icon"=>{},
       "Result"=>
        "<a href=\"http://duckduckgo.com/d/Apple_Valley\">Apple Valley Meanings</a>",
       "FirstURL"=>"http://duckduckgo.com/d/Apple_Valley"},
      {"Text"=>"Big Apple, nickname for New York City",
       "Icon"=>{"URL"=>"http://i.duck.co/i/a8cb4202.jpg"},
       "Result"=>
        "<a href=\"http://duckduckgo.com/Big_Apple\">Big Apple</a>, nickname for New York City",
       "FirstURL"=>"http://duckduckgo.com/Big_Apple"}]},
   {"Name"=>"Technology",
    "Topics"=>
     [{"Text"=>
        "Apple I - The Apple I, also known as the Apple-1, was an early personal computer.",
       "Icon"=>{"URL"=>"http://i.duck.co/i/020104f2.jpg"},
       "Result"=>
        "<a href=\"http://duckduckgo.com/Apple_I\">Apple I</a> - The Apple I, also known as the Apple-1, was an early personal computer.",
       "FirstURL"=>"http://duckduckgo.com/Apple_I"},
      {"Text"=>
        "Apple II - The Apple II is an 8-bit home computer, one of the first highly successful mass-produced microcomputer products, designed primarily by Steve Wozniak, manufactured by Apple Computer and introduce...",
       "Icon"=>{"URL"=>"http://i.duck.co/i/e96a6b64.jpg"},
       "Result"=>
        "<a href=\"http://duckduckgo.com/Apple_II_series\">Apple II</a> - The Apple II is an 8-bit home computer, one of the first highly successful mass-produced microcomputer products, designed primarily by Steve Wozniak, manufactured by Apple Computer and introduce...",
       "FirstURL"=>"http://duckduckgo.com/Apple_II_series"},
      {"Text"=>
        "Apple III - The Apple III is a business-oriented personal computer produced and released by Apple Computer and was intended as the successor to the Apple II series, but largely considered a failure in the m...",
       "Icon"=>{"URL"=>"http://i.duck.co/i/3702da39.jpg"},
       "Result"=>
        "<a href=\"http://duckduckgo.com/Apple_III\">Apple III</a> - The Apple III is a business-oriented personal computer produced and released by Apple Computer and was intended as the successor to the Apple II series, but largely considered a failure in the m...",
       "FirstURL"=>"http://duckduckgo.com/Apple_III"},
      {"Text"=>
        "APPLE (Ariane Passenger Payload Experiment), an Indian experimental communication satellite launched in 1981",
       "Icon"=>{},
       "Result"=>
        "APPLE (<a href=\"http://duckduckgo.com/Ariane_Passenger_Payload_Experiment\">Ariane Passenger Payload Experiment</a>), an Indian experimental communication satellite launched in 1981",
       "FirstURL"=>
        "http://duckduckgo.com/Ariane_Passenger_Payload_Experiment"},
      {"Text"=>
        "Apple (automobile), an American automobile manufactured by Apple Automobile Company from 1917 to 1918",
       "Icon"=>{},
       "Result"=>
        "<a href=\"http://duckduckgo.com/Apple_(automobile)\">Apple (automobile)</a>, an American automobile manufactured by Apple Automobile Company from 1917 to 1918",
       "FirstURL"=>"http://duckduckgo.com/Apple_(automobile)"}]},
   {"Name"=>"Other uses",
    "Topics"=>
     [{"Text"=>
        "APPLE (Accumulation Program for Part-time and Limited-service Employees), a deferred compensation program in California",
       "Icon"=>{},
       "Result"=>
        "APPLE (Accumulation Program for Part-time and Limited-service Employees), a <a href=\"http://duckduckgo.com/deferred_compensation\">deferred compensation</a> program in California",
       "FirstURL"=>"http://duckduckgo.com/deferred_compensation"},
      {"Text"=>
        "Apples (card game) - Apples is a 4-player trick-based game similar in play to hearts, spades, and bridge.",
       "Icon"=>{},
       "Result"=>
        "<a href=\"http://duckduckgo.com/Apples_(card_game)\">Apples (card game)</a> - Apples is a 4-player trick-based game similar in play to hearts, spades, and bridge.",
       "FirstURL"=>"http://duckduckgo.com/Apples_(card_game)"},
      {"Text"=>
        "Apple Cup, the annual college football game between state rivals the University of Washington and Washington State University",
       "Icon"=>{},
       "Result"=>
        "<a href=\"http://duckduckgo.com/Apple_Cup\">Apple Cup</a>, the annual college football game between state rivals the University of Washington and Washington State University",
       "FirstURL"=>"http://duckduckgo.com/Apple_Cup"},
      {"Text"=>"Apple Daily, a Hong-Kong-based newspaper",
       "Icon"=>{"URL"=>"http://i.duck.co/i/a220d44b.jpg"},
       "Result"=>
        "<i><a href=\"http://duckduckgo.com/Apple_Daily\">Apple Daily</a></i>, a Hong-Kong-based newspaper",
       "FirstURL"=>"http://duckduckgo.com/Apple_Daily"},
      {"Text"=>
        "Apple (symbolism) - Apples appear in many religious traditions, often as a mystical or forbidden fruit.",
       "Icon"=>{"URL"=>"http://i.duck.co/i/b58eb2b4.jpg"},
       "Result"=>
        "<a href=\"http://duckduckgo.com/Apple_(symbolism)\">Apple (symbolism)</a> - Apples appear in many religious traditions, often as a mystical or forbidden fruit.",
       "FirstURL"=>"http://duckduckgo.com/Apple_(symbolism)"},
      {"Text"=>"Apples, Vaud, a municipality in Switzerland",
       "Icon"=>{"URL"=>"http://i.duck.co/i/88722dce.png"},
       "Result"=>
        "<a href=\"http://duckduckgo.com/Apples%2C_Vaud\">Apples, Vaud</a>, a municipality in Switzerland",
       "FirstURL"=>"http://duckduckgo.com/Apples%2C_Vaud"}]},
   {"Name"=>"See also",
    "Topics"=>
     [{"Text"=>"Apple shape, one of the four basic female body shapes",
       "Icon"=>{"URL"=>"http://i.duck.co/i/458fcf42.jpg"},
       "Result"=>
        "Apple shape, one of the four basic <a href=\"http://duckduckgo.com/female_body_shape\">female body shape</a>s",
       "FirstURL"=>"http://duckduckgo.com/female_body_shape"},
      {"Text"=>
        "Apple Store (online) - The Apple Store is the online store of Apple Inc..  All of Apple's product lines are carried as well as select brands of accessories for its products.",
       "Icon"=>{},
       "Result"=>
        "<a href=\"http://duckduckgo.com/Apple_Store_(online)\">Apple Store (online)</a> - The Apple Store is the online store of Apple Inc..  All of Apple's product lines are carried as well as select brands of accessories for its products.",
       "FirstURL"=>"http://duckduckgo.com/Apple_Store_(online)"},
      {"Text"=>"Big Apple Meanings",
       "Icon"=>{},
       "Result"=>
        "<a href=\"http://duckduckgo.com/d/Big_Apple\">Big Apple Meanings</a>",
       "FirstURL"=>"http://duckduckgo.com/d/Big_Apple"},
      {"Text"=>"Golden apple Meanings",
       "Icon"=>{},
       "Result"=>
        "<a href=\"http://duckduckgo.com/d/Golden_apple\">Golden apple Meanings</a>",
       "FirstURL"=>"http://duckduckgo.com/d/Golden_apple"},
      {"Text"=>"The Apple Meanings",
       "Icon"=>{},
       "Result"=>
        "<a href=\"http://duckduckgo.com/d/The_Apple\">The Apple Meanings</a>",
       "FirstURL"=>"http://duckduckgo.com/d/The_Apple"},
      {"Text"=>"The Little Apple Meanings",
       "Icon"=>{},
       "Result"=>
        "<a href=\"http://duckduckgo.com/d/The_Little_Apple\">The Little Apple Meanings</a>",
       "FirstURL"=>"http://duckduckgo.com/d/The_Little_Apple"},
      {"Text"=>"Apel - Apel is a German surname.",
       "Icon"=>{},
       "Result"=>
        "<a href=\"http://duckduckgo.com/Apel\">Apel</a> - Apel is a German surname.",
       "FirstURL"=>"http://duckduckgo.com/Apel"},
      {"Text"=>"Appel Meanings",
       "Icon"=>{},
       "Result"=>
        "<a href=\"http://duckduckgo.com/d/Appel\">Appel Meanings</a>",
       "FirstURL"=>"http://duckduckgo.com/d/Appel"},
      {"Text"=>"APPEL Meanings",
       "Icon"=>{},
       "Result"=>
        "<a href=\"http://duckduckgo.com/d/APPEL\">APPEL Meanings</a>",
       "FirstURL"=>"http://duckduckgo.com/d/APPEL"},
      {"Text"=>"Apple Trees, a 1992 German film",
       "Icon"=>{},
       "Result"=>
        "<i><a href=\"http://duckduckgo.com/Apple_Trees\">Apple Trees</a></i>, a 1992 German film",
       "FirstURL"=>"http://duckduckgo.com/Apple_Trees"},
      {"Text"=>"The Apple Tree, a series of three musical playlets",
       "Icon"=>{"URL"=>"http://i.duck.co/i/a53248fd.png"},
       "Result"=>
        "<i><a href=\"http://duckduckgo.com/The_Apple_Tree\">The Apple Tree</a></i>, a series of three musical playlets",
       "FirstURL"=>"http://duckduckgo.com/The_Apple_Tree"}]}],
 "AbstractURL"=>"http://en.wikipedia.org/wiki/Apple_(disambiguation)",
 "Image"=>"",
 "DefinitionURL"=>
  "http://www.thefreedictionary.com/_/search.aspx?pid=aff18&word=apple",
 "DefinitionSource"=>"TheFreeDictionary",
 "AbstractText"=>"",
 "Type"=>"D"}


    zci = DuckDuckGo::ZeroClickInfo.by(data)
    
    assert_equal("Apple", zci.heading)
    assert_equal("Wikipedia", zci.abstract_source)
    assert_nil(zci.image)
    assert_nil(zci.abstract_text)
    assert_equal("TheFreeDictionary", zci.definition_source)
    assert_equal("A deciduous Eurasian tree having alternate simple leaves and white or pink flowers.", zci.definition)
    assert_instance_of(URI::HTTP, zci.definition_url)
    assert_nil(zci.answer_type)
    assert_equal("D", zci.type)
    assert_equal("disambiguation", zci.type_long)
    assert_nil(zci.answer)
    assert_instance_of(URI::HTTP, zci.abstract_url)
    assert_equal('en.wikipedia.org', zci.abstract_url.host)
    assert_equal(0, zci.results.size)
    assert_equal(10, zci.related_topics.size)
    assert_equal(1, zci.related_topics["_"].size)
    assert_equal("The apple is a tree and its pomaceous fruit.", zci.related_topics["_"][0].text)
    assert_not_nil(zci.related_topics["Companies"])
    assert_equal(2, zci.related_topics["Companies"].size)
    assert_equal("Apple Inc., a consumer electronics and software company", zci.related_topics["Companies"][0].text)
  end
end
