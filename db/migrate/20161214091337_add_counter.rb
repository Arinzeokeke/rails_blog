class AddCounter < ActiveRecord::Migration[5.0]
  def change
  	add_column :posts, :counter_cache, :integer, :default => 0
  end
end
