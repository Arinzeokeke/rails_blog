class Post < ApplicationRecord
	validates :title, presence: true
	validates :body, presence: true
	validates_length_of :subtitle, :maximum => 100

end
