class ChangeActionToAct < ActiveRecord::Migration[5.0]
  def change

    add_column :posts, :act, :text
  end
end