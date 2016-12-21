require "bundler/gem_tasks"
require "rake/testtask"
require "standalone_migrations"

Rake::TestTask.new(:test) do |t|
  t.libs << "test"
  t.libs << "lib"
  t.test_files = FileList['test/**/*_test.rb']
end

StandaloneMigrations::Tasks.load_tasks

task :default => :test
