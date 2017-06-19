class Post < ApplicationRecord
	belongs_to :user
	has_many  :comments, dependent: :destroy

	mount_uploader :photo, PhotoUploader
	delegate :photo, :name, to: :user, prefix: true  

	validates :photo, :description, :user_id, presence: true
	acts_as_votable

	scope :of_followed_users, -> (following_users) { where user_id: following_users }  

	 def user_photo
  		user.photo
  	end

  	def user_name
  		user.name
  	end

end
