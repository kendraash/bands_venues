class Venue < ActiveRecord::Base
  has_and_belongs_to_many(:bands)
  validates(:name, :presence => true)
  before_save(:uppercase_first_letter)

  private

    define_method(:uppercase_first_letter) do
      venue_name = self.name.downcase()
      venue_name = venue_name.try(:split, " ").map(&:capitalize).join(' ') || band_name.dowcase!().capitalize!()
      self.name = venue_name
    end
end
