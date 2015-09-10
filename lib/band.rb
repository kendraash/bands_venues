class Band < ActiveRecord::Base
    has_and_belongs_to_many(:venues)
    validates(:name, :presence => true)
    before_save(:uppercase_first_letter)

    private
      define_method(:uppercase_first_letter) do
        band_name = self.name.downcase()
        band_name = band_name.try(:split, " ").map(&:capitalize).join(' ') || band_name.dowcase!().capitalize!()
        self.name = band_name      end

      define_singleton_method(:find_venues) do |band_name|
        venues = Venue.all
        filtered_arr = []
        venues.each do |venue|
          venue.bands.each do |band|
            if band_name.eql?(band.name)
              filtered_arr << venue
            end
          end
        end
      filtered_arr
    end
end
