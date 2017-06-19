class RelationshipsController < ApplicationController
  def follow_user
    #binding.pry
  	@user = User.find_by! id: params[:user_id]
    if current_user.follow @user.id
      respond_to do |format|
        format.html { redirect_to user_path(@user.id)}
        format.js
      end
    end
  end

  def unfollow_user
			@user = User.find_by! id: params[:user_id]
		if current_user.unfollow @user.id
		  respond_to do |format|
		    format.html { redirect_to user_path(@user.id) }
		    format.js
		  end
		end

  end
  
end
