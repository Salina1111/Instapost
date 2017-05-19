class PostsController < ApplicationController
	before_action :authenticate_user!, only: [:new , :create]
	before_action :is_owner?, only: [:edit, :update]
	def create
  		@post = current_user.posts.create(post_params)
  		if @post.valid?
  			redirect_to root_path
  		else
  			render :new, status: :unprocessable_entity
  		end
	end


	def new
		@post = Post.new
	end

	def index
		@posts = Post.all.order("created_at DESC")
	end 

	def edit
		@post = Post.find(params[:id])
	end

	def update
		@post = Post.find(params[:id])
		@post.update(post_params)
		if @post.valid?
			redirect_to root_path
		else
			render :edit, status: :unprocessable_entity
		end
	end

	private
	def post_params
		params.require(:post).permit(:user_id, :photo, :description)
	end

	def is_owner?
		redirect_to root_path if Post.find(params[:id]).user != current_user
		end
	end

end
