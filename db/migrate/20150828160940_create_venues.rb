class CreateVenues < ActiveRecord::Migration
  def change
    create_table(:venues) do |t|
      t.column(:name, :string)
      t.column(:city, :string)
      t.column(:state, :string)
      t.timestamps()
    end
  end
end
