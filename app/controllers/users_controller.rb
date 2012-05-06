class UsersController < ApplicationController
  before_filter :authenticate_user!, except: [:update]
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
    @user = User.find(params[:id])
    if current_user != @user
      render :file => "public/422.html", status:422 and return
    end
  end

  # PUT /users/1
  # PUT /users/1.json
  def update
    @user = User.find(params[:id])

    if current_user != @user.owner
      render :file => "public/422.html", status:422 and return
    end

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
    @users = User.by_styles(params[styles]).
                  by_instruments(params[instruments]).
                  all
    #currently ignore location
  end
end
