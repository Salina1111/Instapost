class Post < ApplicationRecord
	belongs_to :user
	has_many  :comments, dependent: :destroy

	mount_uploader :photo, PhotoUploader

	validates :photo, :description, :user_id, presence: true
	acts_as_votable

	scope :of_followed_users, -> (following_users) { where user_id: following_users }  

end
