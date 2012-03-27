class UserProfilesController < ApplicationController
	def update		
		@user_profile = UserProfile.find(params[:id])
		@user_profile.about_me = params[:whatToKnowAboutMe]		
		@user_profile.want_to = params[:whatYouWant]		

		if @user_profile.update_attributes(params[:user_profile])
			redirect_to showMatches_url
		else
			redirect_to  bitMoreInfo_url
		end

	end
end
