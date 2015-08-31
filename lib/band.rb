class Band < ActiveRecord::Base
    has_and_belongs_to_many(:venues)
    validates(:name, :presence => true)
    before_save(:uppercase_first_letter)

    private
      define_method(:uppercase_first_letter) do
        self.name = name.downcase!().split.map(&:capitalize).join(' ')
      end

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
