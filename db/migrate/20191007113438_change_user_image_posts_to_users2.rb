class ChangeUserImagePostsToUsers2 < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :user_images, :text
  end
end
