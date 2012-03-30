class UsersController < ApplicationController
  # GET /users
  # GET /users.json
	http_basic_authenticate_with :name => APP_CONFIG['username'], :password => APP_CONFIG['password'], 
		:only => [:index, :show, :new, :edit, :create, :update]
  def index
    @users = User.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @users }
    end
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/new
  # GET /users/new.json
  def new
    @user = User.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(params[:user])

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render json: @user, status: :created, location: @user }
      else
        format.html { render action: "new" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /users/1
  # PUT /users/1.json
  def update
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end

	def signup
	 @user = User.new

    respond_to do |format|
      format.html # signup.html.erb
      format.json { render json: @user }
    end
	end

	def createSignupUser
		@user = User.new(params[:user])

		respond_to do |format|
    	if @user.save
				session[:user_id] = @user.id
				format.html{ redirect_to startTest_url, :notice => "You are now signed up!" }
      else 
				format.html { render action: "signup" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
			end
    end
	end

#TODO:refactor this and the bitmoreinfo action into private action as there is repeated code
	def starttest
		if session[:user_id] #make sure logged in.	
			if UserProfile.find_by_user_id(session[:user_id])
				@user_profile = UserProfile.find_by_user_id(session[:user_id])
			else 
				#there is not a profile so create it
				@user_profile = UserProfile.create(:user_id => session[:user_id],:about_me => '', :want_to => '')
			end

			session[:questionNumber] = 1
			session[:qAndA] = { 
				1 => ["problem_first_impulse", "When you are confronted with a problem is your first impulse more likely:", "handle the problem immediately", "imagine what the best outcome would be"], 
				2 => ["first_action", "If your first action of the day could be anything you would like, you would often choose:", "having a quite breakfast alone","getting dressed for a brunch out with friends"],
				3 => ["influenced_by", "Your next vehicle purchase is more likely to be influenced by:", "the amount of money you have", "an expression of your personality"],
				4 => ["help_friend", "The best way to help a friend get over a bad day at work is:", "helping them forget their troubles", "encouraging them to share their feelings"]
			}

			render "testquestion"
		else
			flash.now.alert = "You need to login."
			render "sessions/new"
		end
	end

	def testquestion
		if session[:user_id] #make sure logged in.	
			if UserProfile.find_by_user_id(session[:user_id])
				@user_profile = UserProfile.find_by_user_id(session[:user_id])
			else 
				#there is not a profile so create it
				@user_profile = UserProfile.create(:user_id => session[:user_id],:about_me => '', :want_to => '')
			end

			#respond_to do |format|
			#	format.html # testquestion.html.erb
			#	#format.json { render json: @user }
			#end

			if session[:questionNumber].to_i <= 3 # since we are adding after the check
				session[:questionNumber] = session[:questionNumber] + 1
				#redirect_to testQuestion_url
				render "testquestion"
			else
				session[:questionNumber] = 0
				session[:qAndA] = nil
				render "strengthsview"
			end
		else
			flash.now.alert = "You need to login."
			render "sessions/new"
		end
	end

	def strengthsview
		respond_to do |format|
			format.html # strengthsview.html.erb
			#format.json { render json: @user }
		end
	end

	def bitmoreinfo
		if session[:user_id] #make sure logged in.	
			if UserProfile.find_by_user_id(session[:user_id])
				@user_profile = UserProfile.find_by_user_id(session[:user_id])
				respond_to do |format|
					format.html # bitmoreinfo.html.erb
					#format.json { render json: @user }
				end
			else 
				#there is not a profile so create it
				@user_profile = UserProfile.create(:user_id => session[:user_id],:about_me => '', :want_to => '')
			end
			
		else
			flash.now.alert = "You need to login."
			render "sessions/new"
		end
	end

	def showmatches
	end

	def showprofile
		if session[:user_id] #make sure logged in.
			@user = User.find(session[:user_id])

			want_toHash = { "startSomething" => "start something new.", "joinClub" => "join a club.", 
				"findMentor" => "find a mentor.", "findJob" => "find a job." 
			}
				@user.user_profile.want_to = want_toHash[@user.user_profile.want_to]

			respond_to do |format|
				format.html # showprofile.html.erb
				#format.json { render json: @user }
			end
		else
			flash.now.alert = "You need to login."
			render "sessions/new"
		end
	end

	def showmypods
		if session[:user_id] #make sure logged in.
			@user = User.find(session[:user_id])
			
			respond_to do |format|
				format.html # showmypods.html.erb
				#format.json { render json: @user }
			end
		
		else
			flash.now.alert = "You need to login."
			render "sessions/new"
		end
	end

end


