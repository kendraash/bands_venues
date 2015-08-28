
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
  venue.bands.update({event_date: event_date})
  band =Band.create({name: name, genres: genres, num_members: num_members})
  if(band.save())
    venue.bands.push(band)
  end
  redirect("/venues/#{venue.id}")
end

get('/bands') do
  @bands = Band.all()
  erb(:bands)
end

get('/bands/:id') do
  @band = Band.find(params['id'].to_i)
  @venues = @band.venues
  erb(:band)
end

get('/band/:id/edit') do
  @band = Band.find(params['id'].to_i)
  erb(:band_edit)
end

get('/band/:id/delete') do
  @band = Band.find(params['id'].to_i)
  @venue = Venue.find(@band.venues.first.id)
  @venue.bands.destroy(@band)
  @band.destroy
  redirect("/bands")
end

patch('/band/:id') do
  @band = Band.find(params['id'].to_i)
  name = params['name']
  genres = params['genres']
  num_members = params['num_members']
  @band.update({name: name, genres: genres, num_members: num_members})
  redirect("/bands/#{@band.id}")
end
