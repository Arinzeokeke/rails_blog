class Comment < ApplicationRecord
	belongs_to :commentable, polymorphic: true
	has_many :comments, as: :commentable, dependent: :destroy
	validates :name, presence: true
	validates :body, presence: true

end
