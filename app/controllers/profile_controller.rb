class ProfileController < ApplicationController
 	before_action :authenticate_user!, :unless => :devise_controller?, except: [:index, :show]
 	def show
 		@user=User.find(params[:id])
 		
 	end 
 	def follow
 		user = User.find(params[:id])
 		current_user.follow!(user)
 		redirect_to profile_path(user)
 	end
def unfollow
 		user = User.find(params[:id])
 		current_user.unfollow!(user)
 		redirect_to profile_path(user)
 	end
 	
end 
