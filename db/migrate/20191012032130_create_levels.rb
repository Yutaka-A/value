class CreateLevels < ActiveRecord::Migration[5.0]
  def change
    create_table :levels do |t|
      t.integer :user_level
      t.integer :exp

      t.timestamps
    end
  end
end
