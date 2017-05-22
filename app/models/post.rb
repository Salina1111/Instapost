class Post < ApplicationRecord
	belongs_to :user
	has_many  :comments

	mount_uploader :photo, PhotoUploader

	validates :photo, :description, :user_id, presence: true
end
