class AddColumnToBands < ActiveRecord::Migration
  def change
    add_column(:bands, :event_date, :datetime)
  end
end
