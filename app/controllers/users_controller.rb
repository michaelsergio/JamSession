class UsersController < ApplicationController
  before_filter :authenticate_user!, except: [:update, :search]
  # GET /users
  # GET /users.json
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

  # GET /user/1/edit
  def edit
    @user = current_user
  end

  # PUT /users/1
  # PUT /users/1.json
  def update
    @user = current_user

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to @user, notice: 'Space was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def search 
    @instruments = params[:instruments] || []
    @styles = params[:styles] || []

    @location = params[:location] || request.location
    if Rails.env.development? and !params[:location]
      @location = "NYC"
    end

    @miles = params[:miles] || 20
      
# testing while i have lack of internet access
    @users = User.
                  paginate(page: params[:page], per_page: 25)
=begin
    @users = User.near(@location, @miles).
                  by_styles(@styles).
                  by_instruments(@instruments).
                  with_skills_and_styles.
                  paginate(page: params[:page], per_page: 25)
=end
  end
end
