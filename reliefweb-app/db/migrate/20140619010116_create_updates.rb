class CreateUpdates < ActiveRecord::Migration
  def change
    create_table :updates do |t|
      t.string :headline

      t.timestamps
    end
  end
end
