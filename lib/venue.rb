class Venue < ActiveRecord::Base
  has_and_belongs_to_many(:bands)
  validates(:name, :presence => true)
  before_save(:uppercase_first_letter, :adding_time_event_date)

  private

    define_method(:uppercase_first_letter) do
      self.name = name.downcase!().split.map(&:capitalize).join(' ')
    end
    define_method(:adding_time_event_date) do
      if(self.event_date != nil)
        self.event_date = event_date.(concat('00:00:00'))
      end
    end
end
