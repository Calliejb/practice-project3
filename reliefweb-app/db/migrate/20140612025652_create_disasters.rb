class CreateDisasters < ActiveRecord::Migration
  def change
    create_table :disasters do |t|
      t.string :country
      t.string :problem

      t.timestamps
    end
  end
end
