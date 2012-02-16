require 'rake'

task :default => [:test]

require 'rake/testtask'
desc "Run unit tests"
Rake::TestTask.new("test") { |t|
  t.pattern = 'test/tc_*.rb'
  t.verbose = true
}

begin
  require 'jeweler'
  Jeweler::Tasks.new do |gem|
    gem.name = "duck-duck-go"
    gem.summary = %Q{Access the DuckDuckGo Zero Click Info API}
    gem.description = %Q{A Ruby library to access the DuckDuckGo Zero Click Info API.}
    gem.email = "andrew@arjones.co.uk"
    gem.homepage = "https://github.com/andrewrjones/ruby-duck-duck-go"
    gem.authors = ["andrewrjones"]
    gem.add_dependency('httpclient')
    gem.add_dependency('json')
    # gem is a Gem::Specification... see http://www.rubygems.org/read/chapter/20 for additional settings
  end
  Jeweler::GemcutterTasks.new
rescue LoadError
  puts "Jeweler (or a dependency) not available. Install it with: gem install jeweler"
end

begin
  require 'rcov/rcovtask'
  Rcov::RcovTask.new do |rcov|
    rcov.libs << 'test'
    rcov.pattern = 'test/tc_*.rb'
    rcov.verbose = true
    rcov.rcov_opts << '--exclude gems'
  end
rescue LoadError
  task :rcov do
    abort "RCov is not available. In order to run rcov, you must: sudo gem install rcov"
  end
end

require 'rake/rdoctask'
Rake::RDocTask.new do |rdoc|
  version = File.exist?('VERSION') ? File.read('VERSION') : ""

  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "duck-duck-go #{version}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('LICENSE')
  rdoc.rdoc_files.include('lib/**/*.rb')
end

desc "Run cane to check quality metrics"
task :quality do
  puts `cane --abc-max 10 --gte coverage/covered_percent,99`
  exit $?.exitstatus unless $?.exitstatus == 0
end

# dumps out the result of the query, in JSON and Ruby
# used during development
task :search_dump do
  require 'rubygems'
  require 'httpclient'
  require 'json'
  require 'pp'
  
  unless ENV.include?("query")
    raise "usage: rake search_dump query=___"
  end
  
  args = {
    'q' => ENV['query'],
    'o' => 'json'
  }
  if ENV.include?("skip_disambiguation")
    args['d'] = 1
  end
  
  
  http = HTTPClient.new
  json = http.get_content('http://api.duckduckgo.com/', args)
  ruby = JSON.parse(json)
  
  puts 'JSON'
  puts '----'
  puts json
  puts
  puts 'Ruby'
  puts '----'
  pp ruby
end
