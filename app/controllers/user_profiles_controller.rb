class UserProfilesController < ApplicationController
	def update		
		@user_profile = UserProfile.find(params[:id])
		@user_profile.about_me = params[:whatToKnowAboutMe]		
		@user_profile.want_to = params[:whatYouWant]		

		if @user_profile.update_attributes(params[:user_profile])
			render "users/showmatches"
			#redirect_to showMatches_url
		else
			#TODO: handle error
			redirect_to pages_url
		end

	end
end
