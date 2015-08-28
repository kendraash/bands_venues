class RemoveColumnFromBandsAddColumnToVenues < ActiveRecord::Migration
  def change
    remove_column(:bands, :event_date)
    add_column(:venues, :event_date, :datetime)
  end
end
