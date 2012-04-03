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
  
  def test_zci_category
    
    data = {"AbstractSource"=>"Wikipedia",
 "Answer"=>"",
 "Definition"=>"",
 "Results"=>[],
 "AnswerType"=>"",
 "Abstract"=>"",
 "Heading"=>"The Simpsons characters",
 "RelatedTopics"=>
  [{"Text"=>
     "Abraham Simpson - Abraham Jay \"Abe\" Simpson (voiced by Dan Castellaneta), known near universally simply as Grampa, is a fictional character in the animated television series The Simpsons.",
    "Icon"=>{"URL"=>"http://i.duck.co/i/7b1c968b.png"},
    "Result"=>
     "<a href=\"http://duckduckgo.com/Abraham_Simpson\">Abraham Simpson</a><br>Abraham Jay \"Abe\" Simpson (voiced by Dan Castellaneta), known near universally simply as Grampa, is a fictional character in the animated television series <i>The Simpsons</i>.",
    "FirstURL"=>"http://duckduckgo.com/Abraham_Simpson"},
   {"Text"=>
     "Apu Nahasapeemapetilon - Apu Nahasapeemapetilon, Ph.D. is a character in the animated television series The Simpsons.",
    "Icon"=>{"URL"=>"http://i.duck.co/i/3dfa3dc3.png"},
    "Result"=>
     "<a href=\"http://duckduckgo.com/Apu_Nahasapeemapetilon\">Apu Nahasapeemapetilon</a><br>Apu Nahasapeemapetilon, Ph.D. is a character in the animated television series <i>The Simpsons</i>.",
    "FirstURL"=>"http://duckduckgo.com/Apu_Nahasapeemapetilon"},
   {"Text"=>
     "Barney Gumble - Barnard \"Barney\" Gumble is a fictional character on the American animated sitcom The Simpsons.",
    "Icon"=>{"URL"=>"http://i.duck.co/i/39ce98c0.png"},
    "Result"=>
     "<a href=\"http://duckduckgo.com/Barney_Gumble\">Barney Gumble</a><br>Barnard \"Barney\" Gumble is a fictional character on the American animated sitcom <i>The Simpsons</i>.",
    "FirstURL"=>"http://duckduckgo.com/Barney_Gumble"},
   {"Text"=>
     "Bart Simpson - Bartholomew JoJo \"Bart\" Simpson is a fictional character in the animated television series The Simpsons and part of the eponymous family.",
    "Icon"=>{"URL"=>"http://i.duck.co/i/62a07d9e.png"},
    "Result"=>
     "<a href=\"http://duckduckgo.com/Bart_Simpson\">Bart Simpson</a><br>Bartholomew JoJo \"Bart\" Simpson is a fictional character in the animated television series <i>The Simpsons</i> and part of the eponymous family.",
    "FirstURL"=>"http://duckduckgo.com/Bart_Simpson"},
   {"Text"=>
     "Carl Carlson - Carl Carlson, usually known simply as Carl, is a supporting character in the animated television series The Simpsons voiced by Hank Azaria.",
    "Icon"=>{"URL"=>"http://i.duck.co/i/f572e9ae.png"},
    "Result"=>
     "<a href=\"http://duckduckgo.com/Carl_Carlson\">Carl Carlson</a><br>Carl Carlson, usually known simply as Carl, is a supporting character in the animated television series <i>The Simpsons</i> voiced by Hank Azaria.",
    "FirstURL"=>"http://duckduckgo.com/Carl_Carlson"},
   {"Text"=>
     "Clancy Wiggum - Chief Clancy Wiggum is a fictional character from the animated television series The Simpsons, voiced by Hank Azaria.",
    "Icon"=>{"URL"=>"http://i.duck.co/i/f0eb79ee.png"},
    "Result"=>
     "<a href=\"http://duckduckgo.com/Clancy_Wiggum\">Clancy Wiggum</a><br>Chief Clancy Wiggum is a fictional character from the animated television series <i>The Simpsons</i>, voiced by Hank Azaria.",
    "FirstURL"=>"http://duckduckgo.com/Clancy_Wiggum"},
   {"Text"=>
     "Cletus Spuckler - Cletus Delroy Spuckler is a recurring character in the Fox animated series, The Simpsons, and is voiced by Hank Azaria.",
    "Icon"=>{"URL"=>"http://i.duck.co/i/4d663a85.gif"},
    "Result"=>
     "<a href=\"http://duckduckgo.com/Cletus_Spuckler\">Cletus Spuckler</a><br>Cletus Delroy Spuckler is a recurring character in the Fox animated series, <i>The Simpsons</i>, and is voiced by Hank Azaria.",
    "FirstURL"=>"http://duckduckgo.com/Cletus_Spuckler"},
   {"Text"=>
     "Comic Book Guy - Jeff Albertson, best known as the Comic Book Guy, is a recurring fictional character in the animated television series The Simpsons.",
    "Icon"=>{"URL"=>"http://i.duck.co/i/911ab519.png"},
    "Result"=>
     "<a href=\"http://duckduckgo.com/Comic_Book_Guy\">Comic Book Guy</a><br>Jeff Albertson, best known as the Comic Book Guy, is a recurring fictional character in the animated television series <i>The Simpsons.</i>",
    "FirstURL"=>"http://duckduckgo.com/Comic_Book_Guy"},
   {"Text"=>
     "Edna Krabappel - Edna Krabappel is a fictional character from the animated TV series The Simpsons, voiced by Marcia Wallace.",
    "Icon"=>{"URL"=>"http://i.duck.co/i/1bdfff5e.png"},
    "Result"=>
     "<a href=\"http://duckduckgo.com/Edna_Krabappel\">Edna Krabappel</a><br>Edna Krabappel is a fictional character from the animated TV series <i>The Simpsons</i>, voiced by Marcia Wallace.",
    "FirstURL"=>"http://duckduckgo.com/Edna_Krabappel"},
   {"Text"=>
     "Fat Tony - Fat Tony is a recurring character in the animated sitcom The Simpsons.",
    "Icon"=>{"URL"=>"http://i.duck.co/i/a4583d66.png"},
    "Result"=>
     "<a href=\"http://duckduckgo.com/Fat_Tony\">Fat Tony</a><br>Fat Tony is a recurring character in the animated sitcom <i>The Simpsons</i>.",
    "FirstURL"=>"http://duckduckgo.com/Fat_Tony"},
   {"Text"=>
     "Groundskeeper Willie - Groundskeeper Willie born William Mcdougal  is a recurring character on The Simpsons, voiced by Dan Castellaneta.",
    "Icon"=>{"URL"=>"http://i.duck.co/i/f845601f.png"},
    "Result"=>
     "<a href=\"http://duckduckgo.com/Groundskeeper_Willie\">Groundskeeper Willie</a><br>Groundskeeper Willie born William Mcdougal  is a recurring character on <i>The Simpsons</i>, voiced by Dan Castellaneta.",
    "FirstURL"=>"http://duckduckgo.com/Groundskeeper_Willie"},
   {"Text"=>
     "Hans Moleman - Hans Moleman is a recurring character in the animated television series The Simpsons.",
    "Icon"=>{"URL"=>"http://i.duck.co/i/9f651728.png"},
    "Result"=>
     "<a href=\"http://duckduckgo.com/Hans_Moleman\">Hans Moleman</a><br>Hans Moleman is a recurring character in the animated television series <i>The Simpsons</i>.",
    "FirstURL"=>"http://duckduckgo.com/Hans_Moleman"},
   {"Text"=>
     "Homer Simpson - Homer Jay Simpson is a fictional main character in the animated television series The Simpsons and the father of the eponymous family.",
    "Icon"=>{"URL"=>"http://i.duck.co/i/bf0eb228.png"},
    "Result"=>
     "<a href=\"http://duckduckgo.com/Homer_Simpson\">Homer Simpson</a><br>Homer Jay Simpson is a fictional main character in the animated television series <i>The Simpsons</i> and the father of the eponymous family.",
    "FirstURL"=>"http://duckduckgo.com/Homer_Simpson"},
   {"Text"=>
     "Joe Quimby - Mayor Joseph \"Joe\" Quimby, nicknamed \"Diamond Joe,\" is a recurring character from the animated television series The Simpsons.",
    "Icon"=>{"URL"=>"http://i.duck.co/i/93d80e95.png"},
    "Result"=>
     "<a href=\"http://duckduckgo.com/Joe_Quimby\">Joe Quimby</a><br>Mayor Joseph \"Joe\" Quimby, nicknamed \"Diamond Joe,\" is a recurring character from the animated television series <i>The Simpsons</i>.",
    "FirstURL"=>"http://duckduckgo.com/Joe_Quimby"},
   {"Text"=>
     "Julius Hibbert - Dr. Julius M. Hibbert, M.D., is a recurring character on the animated series The Simpsons.",
    "Icon"=>{"URL"=>"http://i.duck.co/i/c9497b7e.png"},
    "Result"=>
     "<a href=\"http://duckduckgo.com/Julius_Hibbert\">Julius Hibbert</a><br>Dr. Julius M. Hibbert, M.D., is a recurring character on the animated series <i>The Simpsons</i>.",
    "FirstURL"=>"http://duckduckgo.com/Julius_Hibbert"},
   {"Text"=>
     "Kang and Kodos - Kang and Kodos are a duo of recurring characters in the animated television series The Simpsons.",
    "Icon"=>{"URL"=>"http://i.duck.co/i/be84f45b.png"},
    "Result"=>
     "<a href=\"http://duckduckgo.com/Kang_and_Kodos\">Kang and Kodos</a><br>Kang and Kodos are a duo of recurring characters in the animated television series <i>The Simpsons</i>.",
    "FirstURL"=>"http://duckduckgo.com/Kang_and_Kodos"},
   {"Text"=>
     "Kent Brockman - Kent Brockman is a fictional character in the animated television series The Simpsons.",
    "Icon"=>{"URL"=>"http://i.duck.co/i/b6c36d00.jpg"},
    "Result"=>
     "<a href=\"http://duckduckgo.com/Kent_Brockman\">Kent Brockman</a><br>Kent Brockman is a fictional character in the animated television series <i>The Simpsons</i>.",
    "FirstURL"=>"http://duckduckgo.com/Kent_Brockman"},
   {"Text"=>
     "Krusty the Clown - Herschel Shmoikel Pinchas Yerucham Krustofski, better known by the stage name Krusty the Clown, is a fictional character who suffers bipolarity in the animated television series The Simp...",
    "Icon"=>{"URL"=>"http://i.duck.co/i/caa07f01.png"},
    "Result"=>
     "<a href=\"http://duckduckgo.com/Krusty_the_Clown\">Krusty the Clown</a><br>Herschel Shmoikel Pinchas Yerucham Krustofski, better known by the stage name Krusty the Clown, is a fictional character who suffers bipolarity in the animated television series The Simp...",
    "FirstURL"=>"http://duckduckgo.com/Krusty_the_Clown"},
   {"Text"=>
     "Lenny Leonard - Lenford Leonard, MPhys  usually known simply as Lenny, is a supporting character in the Fox animated series The Simpsons, and is voiced by Harry Shearer.",
    "Icon"=>{"URL"=>"http://i.duck.co/i/76575c43.png"},
    "Result"=>
     "<a href=\"http://duckduckgo.com/Lenny_Leonard\">Lenny Leonard</a><br>Lenford Leonard, MPhys  usually known simply as Lenny, is a supporting character in the Fox animated series <i>The Simpsons</i>, and is voiced by Harry Shearer.",
    "FirstURL"=>"http://duckduckgo.com/Lenny_Leonard"},
   {"Text"=>
     "Lionel Hutz - Lionel Hutz is a recurring character from the animated television series The Simpsons.",
    "Icon"=>{"URL"=>"http://i.duck.co/i/94d72e52.jpg"},
    "Result"=>
     "<a href=\"http://duckduckgo.com/Lionel_Hutz\">Lionel Hutz</a><br>Lionel Hutz is a recurring character from the animated television series <i>The Simpsons</i>.",
    "FirstURL"=>"http://duckduckgo.com/Lionel_Hutz"},
   {"Text"=>
     "Lisa Simpson - Lisa Marie Simpson is a fictional main character in the animated television series The Simpsons.",
    "Icon"=>{"URL"=>"http://i.duck.co/i/0c6d3b53.png"},
    "Result"=>
     "<a href=\"http://duckduckgo.com/Lisa_Simpson\">Lisa Simpson</a><br>Lisa Marie Simpson is a fictional main character in the animated television series <i>The Simpsons</i>.",
    "FirstURL"=>"http://duckduckgo.com/Lisa_Simpson"},
   {"Text"=>
     "Maggie Simpson - Margaret \"Maggie\" Simpson is a fictional character in the animated television series The Simpsons.",
    "Icon"=>{"URL"=>"http://i.duck.co/i/c018dead.png"},
    "Result"=>
     "<a href=\"http://duckduckgo.com/Maggie_Simpson\">Maggie Simpson</a><br>Margaret \"Maggie\" Simpson is a fictional character in the animated television series <i>The Simpsons</i>.",
    "FirstURL"=>"http://duckduckgo.com/Maggie_Simpson"},
   {"Text"=>
     "Marge Simpson - Marjorie \"Marge\" Simpson is a fictional main character in the animated television series The Simpsons and the matriarch of the eponymous family.",
    "Icon"=>{"URL"=>"http://i.duck.co/i/b75bd67d.png"},
    "Result"=>
     "<a href=\"http://duckduckgo.com/Marge_Simpson\">Marge Simpson</a><br>Marjorie \"Marge\" Simpson is a fictional main character in the animated television series <i>The Simpsons</i> and the matriarch of the eponymous family.",
    "FirstURL"=>"http://duckduckgo.com/Marge_Simpson"},
   {"Text"=>
     "Martin Prince - Martin Prince, Jr. is a recurring character in the Fox animated series, The Simpsons, and is voiced by Russi Taylor.",
    "Icon"=>{"URL"=>"http://i.duck.co/i/eb68975c.png"},
    "Result"=>
     "<a href=\"http://duckduckgo.com/Martin_Prince\">Martin Prince</a><br>Martin Prince, Jr. is a recurring character in the Fox animated series, <i>The Simpsons</i>, and is voiced by Russi Taylor.",
    "FirstURL"=>"http://duckduckgo.com/Martin_Prince"},
   {"Text"=>
     "Milhouse Van Houten - Milhouse Mussolini Van Houten is a fictional character featured in the animated television series The Simpsons, voiced by Pamela Hayden.",
    "Icon"=>{"URL"=>"http://i.duck.co/i/c1923cb1.png"},
    "Result"=>
     "<a href=\"http://duckduckgo.com/Milhouse_Van_Houten\">Milhouse Van Houten</a><br>Milhouse Mussolini Van Houten is a fictional character featured in the animated television series <i>The Simpsons</i>, voiced by Pamela Hayden.",
    "FirstURL"=>"http://duckduckgo.com/Milhouse_Van_Houten"},
   {"Text"=>
     "Moe Szyslak - Momar \"Moe\" Szyslak () is a fictional character in the American animated television series, The Simpsons.",
    "Icon"=>{"URL"=>"http://i.duck.co/i/388580ad.png"},
    "Result"=>
     "<a href=\"http://duckduckgo.com/Moe_Szyslak\">Moe Szyslak</a><br>Momar \"Moe\" Szyslak () is a fictional character in the American animated television series, <i>The Simpsons</i>.",
    "FirstURL"=>"http://duckduckgo.com/Moe_Szyslak"},
   {"Text"=>
     "Mona Simpson (The Simpsons) - Mona J. Simpson is a recurring fictional character in the animated television series The Simpsons.",
    "Icon"=>{"URL"=>"http://i.duck.co/i/ba6285fb.png"},
    "Result"=>
     "<a href=\"http://duckduckgo.com/Mona_Simpson_(The_Simpsons)\">Mona Simpson (The Simpsons)</a><br>Mona J. Simpson is a recurring fictional character in the animated television series <i>The Simpsons</i>.",
    "FirstURL"=>"http://duckduckgo.com/Mona_Simpson_(The_Simpsons)"},
   {"Text"=>
     "Mr. Burns - Charles Montgomery Plantagenet Schicklgruber\"Monty\" Burns, usually referred to as Mr. Burns, is a recurring fictional character in the animated television series The Simpsons,...",
    "Icon"=>{"URL"=>"http://i.duck.co/i/cf311517.png"},
    "Result"=>
     "<a href=\"http://duckduckgo.com/Mr._Burns\">Mr. Burns</a><br>Charles Montgomery Plantagenet Schicklgruber\"Monty\" Burns, usually referred to as Mr. Burns, is a recurring fictional character in the animated television series <i>The Simpsons</i>,...",
    "FirstURL"=>"http://duckduckgo.com/Mr._Burns"},
   {"Text"=>
     "Ned Flanders - Nedward \"Ned\" Flanders is a recurring fictional character in the animated television series The Simpsons.",
    "Icon"=>{"URL"=>"http://i.duck.co/i/e66f380d.png"},
    "Result"=>
     "<a href=\"http://duckduckgo.com/Ned_Flanders\">Ned Flanders</a><br>Nedward \"Ned\" Flanders is a recurring fictional character in the animated television series <i>The Simpsons</i>.",
    "FirstURL"=>"http://duckduckgo.com/Ned_Flanders"},
   {"Text"=>
     "Nelson Muntz - Nelson Mandela Muntz is a fictional character from the animated TV series The Simpsons.",
    "Icon"=>{"URL"=>"http://i.duck.co/i/23702790.png"},
    "Result"=>
     "<a href=\"http://duckduckgo.com/Nelson_Muntz\">Nelson Muntz</a><br>Nelson Mandela Muntz is a fictional character from the animated TV series <i>The Simpsons</i>.",
    "FirstURL"=>"http://duckduckgo.com/Nelson_Muntz"},
   {"Text"=>
     "Nick Riviera - Dr. Nick Riviera, M.D. is a fictional character on the animated television series The Simpsons.",
    "Icon"=>{"URL"=>"http://i.duck.co/i/db757c91.png"},
    "Result"=>
     "<a href=\"http://duckduckgo.com/Nick_Riviera\">Nick Riviera</a><br>Dr. Nick Riviera, M.D. is a fictional character on the animated television series <i>The Simpsons</i>.",
    "FirstURL"=>"http://duckduckgo.com/Nick_Riviera"},
   {"Text"=>
     "Otto Mann - Otto Mann is a fictional character on the animated TV series The Simpsons, voiced by Harry Shearer.",
    "Icon"=>{"URL"=>"http://i.duck.co/i/9ba5c930.png"},
    "Result"=>
     "<a href=\"http://duckduckgo.com/Otto_Mann\">Otto Mann</a><br>Otto Mann is a fictional character on the animated TV series <i>The Simpsons</i>, voiced by Harry Shearer.",
    "FirstURL"=>"http://duckduckgo.com/Otto_Mann"},
   {"Text"=>
     "Patty and Selma Bouvier - Patty and Selma Bouvier () are fictional twins in the Fox Broadcasting animated series, The Simpsons, and are voiced by Julie Kavner.",
    "Icon"=>{"URL"=>"http://i.duck.co/i/9f1ecf46.png"},
    "Result"=>
     "<a href=\"http://duckduckgo.com/Patty_and_Selma_Bouvier\">Patty and Selma Bouvier</a><br>Patty and Selma Bouvier () are fictional twins in the Fox Broadcasting animated series, <i>The Simpsons</i>, and are voiced by Julie Kavner.",
    "FirstURL"=>"http://duckduckgo.com/Patty_and_Selma_Bouvier"},
   {"Text"=>
     "Professor Frink - Professor John Nerdelbaum Frink, Jr. is a recurring character in the American animated television series The Simpsons.",
    "Icon"=>{"URL"=>"http://i.duck.co/i/c9dc0e13.png"},
    "Result"=>
     "<a href=\"http://duckduckgo.com/Professor_Frink\">Professor Frink</a><br>Professor John Nerdelbaum Frink, Jr. is a recurring character in the American animated television series <i>The Simpsons</i>.",
    "FirstURL"=>"http://duckduckgo.com/Professor_Frink"},
   {"Text"=>
     "Ralph Wiggum - Ralph Wiggum is a recurring fictional character on the animated series The Simpsons, voiced by Nancy Cartwright.",
    "Icon"=>{"URL"=>"http://i.duck.co/i/2f9c97eb.png"},
    "Result"=>
     "<a href=\"http://duckduckgo.com/Ralph_Wiggum\">Ralph Wiggum</a><br>Ralph Wiggum is a recurring fictional character on the animated series <i>The Simpsons</i>, voiced by Nancy Cartwright.",
    "FirstURL"=>"http://duckduckgo.com/Ralph_Wiggum"},
   {"Text"=>
     "Reverend Timothy Lovejoy - The Reverend Timothy Lovejoy is a recurring character in the animated television series The Simpsons.",
    "Icon"=>{"URL"=>"http://i.duck.co/i/5359e785.png"},
    "Result"=>
     "<a href=\"http://duckduckgo.com/Reverend_Timothy_Lovejoy\">Reverend Timothy Lovejoy</a><br>The Reverend Timothy Lovejoy is a recurring character in the animated television series <i>The Simpsons</i>.",
    "FirstURL"=>"http://duckduckgo.com/Reverend_Timothy_Lovejoy"},
   {"Text"=>
     "Santa's Little Helper - Santa's Little Helper is a fictional dog.",
    "Icon"=>{"URL"=>"http://i.duck.co/i/6825f3f5.png"},
    "Result"=>
     "<a href=\"http://duckduckgo.com/Santa's_Little_Helper\">Santa's Little Helper</a><br>Santa's Little Helper is a fictional dog.",
    "FirstURL"=>"http://duckduckgo.com/Santa's_Little_Helper"},
   {"Text"=>
     "Seymour Skinner - W. Seymour Skinner (born Armin Tamzarian) is a fictional character on the animated sitcom The Simpsons who is voiced by Harry Shearer.",
    "Icon"=>{"URL"=>"http://i.duck.co/i/785a66ec.png"},
    "Result"=>
     "<a href=\"http://duckduckgo.com/Seymour_Skinner\">Seymour Skinner</a><br>W. Seymour Skinner (born Armin Tamzarian) is a fictional character on the animated sitcom <i>The Simpsons</i> who is voiced by Harry Shearer.",
    "FirstURL"=>"http://duckduckgo.com/Seymour_Skinner"},
   {"Text"=>
     "Sideshow Bob - Robert Underdunk-Terwilliger, better known by his stage name Sideshow Bob, is a recurring character in the animated television series The Simpsons.",
    "Icon"=>{"URL"=>"http://i.duck.co/i/922b6a1c.png"},
    "Result"=>
     "<a href=\"http://duckduckgo.com/Sideshow_Bob\">Sideshow Bob</a><br>Robert Underdunk-Terwilliger, better known by his stage name Sideshow Bob, is a recurring character in the animated television series <i>The Simpsons</i>.",
    "FirstURL"=>"http://duckduckgo.com/Sideshow_Bob"},
   {"Text"=>
     "Snowball (The Simpsons) - The name Snowball refers to five fictional cats that have been owned by the Simpson family in the TV show The Simpsons.",
    "Icon"=>{"URL"=>"http://i.duck.co/i/6a833a5a.png"},
    "Result"=>
     "<a href=\"http://duckduckgo.com/Snowball_(The_Simpsons)\">Snowball (The Simpsons)</a><br>The name Snowball refers to five fictional cats that have been owned by the Simpson family in the TV show <i>The Simpsons</i>.",
    "FirstURL"=>"http://duckduckgo.com/Snowball_(The_Simpsons)"},
   {"Text"=>
     "The Itchy & Scratchy Show - The Itchy & Scratchy Show is a fictional animated television series from The Simpsons.",
    "Icon"=>{"URL"=>"http://i.duck.co/i/d8a3a294.png"},
    "Result"=>
     "<a href=\"http://duckduckgo.com/The_Itchy_%26_Scratchy_Show\">The Itchy & Scratchy Show</a><br><i>The Itchy & Scratchy Show</i> is a fictional animated television series from <i>The Simpsons</i>.",
    "FirstURL"=>"http://duckduckgo.com/The_Itchy_%26_Scratchy_Show"},
   {"Text"=>
     "Troy McClure - Troy McClure is a fictional character in the American animated sitcom The Simpsons.",
    "Icon"=>{"URL"=>"http://i.duck.co/i/20433a15.png"},
    "Result"=>
     "<a href=\"http://duckduckgo.com/Troy_McClure\">Troy McClure</a><br>Troy McClure is a fictional character in the American animated sitcom <i>The Simpsons</i>.",
    "FirstURL"=>"http://duckduckgo.com/Troy_McClure"},
   {"Text"=>
     "Waylon Smithers - Waylon Smithers, Jr. usually referred to as Smithers is a recurring fictional character in the animated series The Simpsons, who is voiced by Harry Shearer.",
    "Icon"=>{"URL"=>"http://i.duck.co/i/12f25a94.png"},
    "Result"=>
     "<a href=\"http://duckduckgo.com/Waylon_Smithers\">Waylon Smithers</a><br>Waylon Smithers, Jr. usually referred to as Smithers is a recurring fictional character in the animated series <i>The Simpsons</i>, who is voiced by Harry Shearer.",
    "FirstURL"=>"http://duckduckgo.com/Waylon_Smithers"}],
 "AbstractURL"=>"http://en.wikipedia.org/wiki/The_Simpsons_characters",
 "Image"=>"",
 "DefinitionURL"=>"",
 "DefinitionSource"=>"",
 "AbstractText"=>"",
 "Type"=>"C"}

    zci = DuckDuckGo::ZeroClickInfo.by(data)
    
    assert_equal("The Simpsons characters", zci.heading)
    assert_equal("Wikipedia", zci.abstract_source)
    assert_nil(zci.image)
    assert_nil(zci.abstract_text)
    assert_nil(zci.definition_source)
    assert_nil(zci.definition_url)
    assert_nil(zci.answer_type)
    assert_equal("C", zci.type)
    assert_equal("category", zci.type_long)
    assert_nil(zci.answer)
    assert_instance_of(URI::HTTP, zci.abstract_url)
    assert_equal('en.wikipedia.org', zci.abstract_url.host)
    assert_equal(0, zci.results.size)
    assert_equal(1, zci.related_topics.size)
    assert_equal(43, zci.related_topics["_"].size)
    assert_equal("Abraham Simpson - Abraham Jay \"Abe\" Simpson (voiced by Dan Castellaneta), known near universally simply as Grampa, is a fictional character in the animated television series The Simpsons.", zci.related_topics["_"][0].text)
  end
  
  def test_zci_exclusive
    
    data = {"AbstractSource"=>"Wikipedia",
 "Answer"=>"",
 "Definition"=>
  "Lorem ipsum - A common piece of text used as mock- content when testing a given page layout or font.",
 "Results"=>
  [{"Text"=>
     "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec a diam lectus. Sed sit amet ipsum mauris. Maecenas congue ligula ac quam viverra nec consectetur ante hendrerit. Donec et mollis dolor. Praesent et diam eget libero egestas mattis sit amet vitae augue. Nam tincidunt congue enim, ut porta lorem lacinia consectetur. Donec ut libero sed arcu vehicula ultricies a non tortor. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean ut gravida lorem. Ut turpis felis, pulvinar a semper sed, adipiscing id dolor. Pellentesque auctor nisi id magna consequat sagittis. Curabitur dapibus enim sit amet elit pharetra tincidunt feugiat nisl imperdiet. Ut convallis libero in urna ultrices accumsan. Donec sed odio eros. Donec viverra mi quis quam pulvinar at malesuada arcu rhoncus. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. In rutrum accumsan ultricies. Mauris vitae nisi at sem facilisis semper ac in est.<p> - Vivamus fermentum semper porta. Nunc diam velit, adipiscing ut tristique vitae, sagittis vel odio. Maecenas convallis ullamcorper ultricies. Curabitur ornare, ligula semper consectetur sagittis, nisi diam iaculis velit, id fringilla sem nunc vel mi. Nam dictum, odio nec pretium volutpat, arcu ante placerat erat, non tristique elit urna et turpis. Quisque mi metus, ornare sit amet fermentum et, tincidunt et orci. Fusce eget orci a orci congue vestibulum. Ut dolor diam, elementum et vestibulum eu, porttitor vel elit. Curabitur venenatis pulvinar tellus gravida ornare. Sed et erat faucibus nunc euismod ultricies ut id justo. Nullam cursus suscipit nisi, et ultrices justo sodales nec. Fusce venenatis facilisis lectus ac semper. Aliquam at massa ipsum. Quisque bibendum purus convallis nulla ultrices ultricies. Nullam aliquam, mi eu aliquam tincidunt, purus velit laoreet tortor, viverra pretium nisi quam vitae mi. Fusce vel volutpat elit. Nam sagittis nisi dui.<p> - Suspendisse lectus leo, consectetur in tempor sit amet, placerat quis neque. Etiam luctus porttitor lorem, sed suscipit est rutrum non. Curabitur lobortis nisl a enim congue semper. Aenean commodo ultrices imperdiet. Vestibulum ut justo vel sapien venenatis tincidunt. Phasellus eget dolor sit amet ipsum dapibus condimentum vitae quis lectus. Aliquam ut massa in turpis dapibus convallis. Praesent elit lacus, vestibulum at malesuada et, ornare et est. Ut augue nunc, sodales ut euismod non, adipiscing vitae orci. Mauris ut placerat justo. Mauris in ultricies enim. Quisque nec est eleifend nulla ultrices egestas quis ut quam. Donec sollicitudin lectus a mauris pulvinar id aliquam urna cursus. Cras quis ligula sem, vel elementum mi. Phasellus non ullamcorper urna.<p> - Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. In euismod ultrices facilisis. Vestibulum porta sapien adipiscing augue congue id pretium lectus molestie. Proin quis dictum nisl. Morbi id quam sapien, sed vestibulum sem. Duis elementum rutrum mauris sed convallis. Proin vestibulum magna mi. Aenean tristique hendrerit magna, ac facilisis nulla hendrerit ut. Sed non tortor sodales quam auctor elementum. Donec hendrerit nunc eget elit pharetra pulvinar. Suspendisse id tempus tortor. Aenean luctus, elit commodo laoreet commodo, justo nisi consequat massa, sed vulputate quam urna quis eros. Donec vel. &nbsp;",
    "Icon"=>{"URL"=>"", "Width"=>16, "Height"=>16},
    "Result"=>
     "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec a diam lectus. Sed sit amet ipsum mauris. Maecenas congue ligula ac quam viverra nec consectetur ante hendrerit. Donec et mollis dolor. Praesent et diam eget libero egestas mattis sit amet vitae augue. Nam tincidunt congue enim, ut porta lorem lacinia consectetur. Donec ut libero sed arcu vehicula ultricies a non tortor. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean ut gravida lorem. Ut turpis felis, pulvinar a semper sed, adipiscing id dolor. Pellentesque auctor nisi id magna consequat sagittis. Curabitur dapibus enim sit amet elit pharetra tincidunt feugiat nisl imperdiet. Ut convallis libero in urna ultrices accumsan. Donec sed odio eros. Donec viverra mi quis quam pulvinar at malesuada arcu rhoncus. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. In rutrum accumsan ultricies. Mauris vitae nisi at sem facilisis semper ac in est.<p><br>Vivamus fermentum semper porta. Nunc diam velit, adipiscing ut tristique vitae, sagittis vel odio. Maecenas convallis ullamcorper ultricies. Curabitur ornare, ligula semper consectetur sagittis, nisi diam iaculis velit, id fringilla sem nunc vel mi. Nam dictum, odio nec pretium volutpat, arcu ante placerat erat, non tristique elit urna et turpis. Quisque mi metus, ornare sit amet fermentum et, tincidunt et orci. Fusce eget orci a orci congue vestibulum. Ut dolor diam, elementum et vestibulum eu, porttitor vel elit. Curabitur venenatis pulvinar tellus gravida ornare. Sed et erat faucibus nunc euismod ultricies ut id justo. Nullam cursus suscipit nisi, et ultrices justo sodales nec. Fusce venenatis facilisis lectus ac semper. Aliquam at massa ipsum. Quisque bibendum purus convallis nulla ultrices ultricies. Nullam aliquam, mi eu aliquam tincidunt, purus velit laoreet tortor, viverra pretium nisi quam vitae mi. Fusce vel volutpat elit. Nam sagittis nisi dui.<p><br>Suspendisse lectus leo, consectetur in tempor sit amet, placerat quis neque. Etiam luctus porttitor lorem, sed suscipit est rutrum non. Curabitur lobortis nisl a enim congue semper. Aenean commodo ultrices imperdiet. Vestibulum ut justo vel sapien venenatis tincidunt. Phasellus eget dolor sit amet ipsum dapibus condimentum vitae quis lectus. Aliquam ut massa in turpis dapibus convallis. Praesent elit lacus, vestibulum at malesuada et, ornare et est. Ut augue nunc, sodales ut euismod non, adipiscing vitae orci. Mauris ut placerat justo. Mauris in ultricies enim. Quisque nec est eleifend nulla ultrices egestas quis ut quam. Donec sollicitudin lectus a mauris pulvinar id aliquam urna cursus. Cras quis ligula sem, vel elementum mi. Phasellus non ullamcorper urna.<p><br>Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. In euismod ultrices facilisis. Vestibulum porta sapien adipiscing augue congue id pretium lectus molestie. Proin quis dictum nisl. Morbi id quam sapien, sed vestibulum sem. Duis elementum rutrum mauris sed convallis. Proin vestibulum magna mi. Aenean tristique hendrerit magna, ac facilisis nulla hendrerit ut. Sed non tortor sodales quam auctor elementum. Donec hendrerit nunc eget elit pharetra pulvinar. Suspendisse id tempus tortor. Aenean luctus, elit commodo laoreet commodo, justo nisi consequat massa, sed vulputate quam urna quis eros. Donec vel. <a href=\"http://lipsum.com\">&nbsp;</a>",
    "FirstURL"=>"http://lipsum.com"}],
 "AnswerType"=>"",
 "Abstract"=>"",
 "Heading"=>"Lorem Ipsum",
 "RelatedTopics"=>[],
 "AbstractURL"=>"http://en.wikipedia.org/wiki/Lorem_Ipsum",
 "Image"=>"",
 "DefinitionURL"=>
  "http://www.merriam-webster.com/dictionary/lorem ipsum",
 "DefinitionSource"=>"TheFreeDictionary",
 "AbstractText"=>"",
 "Type"=>"E"}

    zci = DuckDuckGo::ZeroClickInfo.by(data)
    
    assert_equal("Lorem Ipsum", zci.heading)
    assert_equal("Wikipedia", zci.abstract_source)
    assert_nil(zci.image)
    assert_nil(zci.abstract_text)
    assert_equal("TheFreeDictionary", zci.definition_source)
    assert_equal("Lorem ipsum - A common piece of text used as mock- content when testing a given page layout or font.", zci.definition)
    assert_instance_of(URI::HTTP, zci.definition_url)
    assert_nil(zci.answer_type)
    assert_equal("E", zci.type)
    assert_equal("exclusive", zci.type_long)
    assert_nil(zci.answer)
    assert_instance_of(URI::HTTP, zci.abstract_url)
    assert_equal('en.wikipedia.org', zci.abstract_url.host)
    assert_equal(1, zci.results.size)
    assert_equal(0, zci.related_topics.size)
  end
end
