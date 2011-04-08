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
