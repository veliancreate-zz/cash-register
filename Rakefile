require 'rubocop/rake_task'
require 'rspec/core/rake_task'
require 'sinatra/activerecord/rake'

namespace :db do
  task :load_config do
    require './app/app'
  end
end

RuboCop::RakeTask.new(:cop)
RSpec::Core::RakeTask.new(:spec)

task default: [:cop, :spec]

task :console do
  require 'irb'
  require 'irb/completion'
  require_relative 'app/lib/receipt'
  ARGV.clear
  IRB.start
end
