class CreateBands < ActiveRecord::Migration
  def change
    create_table(:bands) do |t|
      t.column(:name, :string)
      t.column(:genres, :string)
      t.column(:num_members, :integer)
      t.timestamps()
    end
  end
end
