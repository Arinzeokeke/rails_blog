class AddSlugs < ActiveRecord::Migration[5.0]
  def change
  	add_index :posts, :slug, unique: true
  end
end
