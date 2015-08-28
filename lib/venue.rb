class Venue < ActiveRecord::Base
  has_and_belongs_to_many(:bands)
  before_save(:uppercase_first_letter)
  private

    define_method(:uppercase_first_letter) do
      self.name = name.downcase!().split.map(&:capitalize).join(' ')
    end
end
