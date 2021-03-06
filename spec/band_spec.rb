require('spec_helper')

describe(Band) do

  describe('#venues') do
    it('returns a venue') do
      new_band = Band.create({name: 'Fry'})
      new_venue = new_band.venues.create({name: 'Suprise', city: 'Boise', state: 'ID'})
      expect(new_band.venues).to(eq([new_venue]))
    end

    it("validates presence of a band name") do
      band = Band.new({:name => ""})
      expect(band.save()).to(eq(false))
    end
    it('returns name of a band title cased') do
      new_band = Band.create({name: 'RED hot Chilli peppers'})
      expect(new_band.name).to(eq("Red Hot Chilli Peppers"))
    end
  end
end
