class CreateBreweries < ActiveRecord::Migration
  def change
    create_table :breweries do |t|
      t.string :name
      t.references :emotion, index: true

      t.timestamps
    end
  end
end
