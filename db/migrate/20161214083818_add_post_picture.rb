class AddPostPicture < ActiveRecord::Migration[5.0]
  def change
  	add_attachment :posts, :avatar
  end
end
