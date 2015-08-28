require('spec_helper')

describe(Venue) do

  describe('#bands') do
    it('returns a venue') do
      new_venue = Venue.create({name: 'Suprise', city: 'Boise', state: 'ID'})
      new_band = new_venue.bands.create({name: 'Fry'})
      expect(new_venue.bands).to(eq([new_band]))
    end
  end
end
