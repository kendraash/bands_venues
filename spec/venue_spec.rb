require('spec_helper')

describe(Venue) do

  describe('#bands') do
    it('returns a venue') do
      new_venue = Venue.create({name: 'Suprise', city: 'Boise', state: 'ID'})
      new_band = new_venue.bands.create({name: 'Fry'})
      expect(new_venue.bands).to(eq([new_band]))
    end

    it('returns name of venue title cased') do
      new_venue = Venue.create({name: 'CrYstall BALLroom', city: 'Boise', state: 'ID'})
      expect(new_venue.name).to(eq("Crystall Ballroom"))
    end
  end
end
