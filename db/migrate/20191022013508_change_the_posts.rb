class ChangeThePosts < ActiveRecord::Migration[5.0]
  def change
    remove_column :posts, :user_image, :text
    add_column :posts, :value, :text
    add_column :posts, :forWho, :text
  end
end
