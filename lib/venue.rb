class Venue < ActiveRecord::Base
  has_and_belongs_to_many(:bands)
  validates(:name, :presence => true)
  before_save(:uppercase_first_letter)

  private

    define_method(:uppercase_first_letter) do
      
      else
        self.name = name.downcase!().try(:split, " ").map(&:capitalize).join(' ') || name.dowcase!().capitalize!()
      end
    end
end
