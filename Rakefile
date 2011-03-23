require 'rake'

task :default => [:test]

require 'rake/testtask'
desc "Run unit tests"
Rake::TestTask.new("test") { |t|
  t.pattern = 'test/tc_*.rb'
  t.verbose = true
}

begin
  require 'rcov/rcovtask'
  Rcov::RcovTask.new do |test|
    test.libs << 'test'
    test.pattern = 'test/tc_*.rb'
    test.verbose = true
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
  rdoc.rdoc_files.include('lib/**/*.rb')
  #rdoc.rdoc_files.include('script/*.rb')
end
