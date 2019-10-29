class ChangeColumnsToPosts < ActiveRecord::Migration[5.0]
  def change
    remove_column :posts, :user_image, :string
    remove_column :posts, :title, :string
    remove_column :posts, :genre, :string
    add_column :posts, :user_image, :text
    add_column :posts, :title, :text
    add_column :posts, :genre, :text
  end
end
