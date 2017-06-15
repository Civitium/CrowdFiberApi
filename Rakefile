require "bundler/gem_tasks"
require 'rake/testtask'
 
Rake::TestTask.new do |t|
  t.test_files = FileList['spec/lib/*_spec.rb', 'spec/lib/private/*']
  t.verbose = true
end
 
task :default => :test
