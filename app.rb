
require("bundler/setup")
Bundler.require(:default)
require('./lib/band')
require('./lib/venue')
require('pry')

get('/') do
  @venues = Venue.all
  erb(:index)
end

get('/venues/new') do
  erb(:venues_form)
end

post('/venues') do
  name = params['name']
  city = params['city']
  state = params['state']
  Venue.create({name: name, city: city, state: state})
  redirect('/')
end
