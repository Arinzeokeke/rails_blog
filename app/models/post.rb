class Post < ApplicationRecord
	validates :title, presence: true
	validates :body, presence: true
	has_many :comments, as: :commentable, dependent: :destroy
	acts_as_taggable
	is_impressionable :counter_cache => true, :column_name => :counter_cache
	validates_length_of :subtitle, :maximum => 100
	include FriendlyId
	friendly_id :title, use: :slugged
	has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  	validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/

end
