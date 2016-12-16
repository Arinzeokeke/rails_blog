class Adddepthtocomment < ActiveRecord::Migration[5.0]
  def change
  	add_column :comments, :depth, :integer, :default => 0
  end
end
