class CreateBandsVenues < ActiveRecord::Migration
  def change
    create_table(:bands_venues) do |t|
      t.column(:band_id, :integer)
      t.column(:venue_id, :integer)

      t.timestamps()
    end
  end
end
