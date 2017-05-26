class Post < ApplicationRecord
	belongs_to :user
	has_many  :comments, dependent: :destroy

	mount_uploader :photo, PhotoUploader

	validates :photo, :description, :user_id, presence: true
	act_as_votable
end
