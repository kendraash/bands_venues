ENV['RACK_ENV'] = 'test'

require("bundler/setup")
Bundler.require(:default, :test)
set(:root, Dir.pwd())

require("band")
require("venue")

RSpec.configure do |config|
  config.after(:each) do
    Band.all().each() do |band|
      band.destroy()
    end
    Venue.all().each() do |venue|
      venue.destroy()
    end
  end
end
# 
# require('capybara/rspec')
# Capybara.app = Sinatra::Application
# set(:show_exceptions, false)
# require('./app')
