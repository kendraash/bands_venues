
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

get('/venues/:id') do
  @venue = Venue.find(params['id'].to_i)
  @bands = @venue.bands
  erb(:venue)
end

get('/venue/:id/band/new') do
  @venue = Venue.find(params['id'].to_i)
  erb(:band_form)
end


post('/band/new') do
  venue = Venue.find(params['venue_id'].to_i)
  name = params['name']
  genres = params['genres']
  num_members = params['num_members']
  event_date = params['event_date']
  binding.pry

  band =Band.create({name: name, genres: genres, num_members: num_members, event_date: event_date})
  venue.bands.push(band)
  redirect("/venues/#{venue.id}")
end
