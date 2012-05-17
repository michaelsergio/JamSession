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

    # XXX optimize later, because this is retarded (excuse: demo-day)

    # splits out style/skills for regeneration 
    user_params = params[:user].except(:styles).except(:skills)
    rest = params[:user].slice(:styles, :skills)

    # update skills/styles by destroying all and regenerating them
    @user.styles.destroy_all
    @user.skills.destroy_all

    updated = @user.update_attributes(user_params)
    if updated 
      styles_param = params[:user][:styles]
      if styles_param
        styles_param.split(',').each do |style_id|
          ps = PersonalStyle.create(style: Style.find_by_id(style_id),
                                    user: @user)
        end
      end
      if
        skills_param = params[:user][:skills]
        skills_param.split(',').each do |skill_id|
          ps = PersonalSkill.create(skill: Skill.find_by_id(skill_id),
                                    user: @user,
                                    expertise_level: 2)
        end
      end
    end

    respond_to do |format|
      if updated
        format.html { redirect_to @user, notice: 'Space was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def search 
    @skills = params[:skills].split(',') || []
    @styles = params[:styles].split(',') || []

    @location = params[:location] || request.location
    if Rails.env.development? and !params[:location]
      @location = "NYC"
    end

    @miles = params[:miles] || 20
    
    @users = User
                 .by_skills(@skills)
                 .paginate(page: params[:page], per_page: 25)
#.with_skills_and_styles(@skills, @styles)
#                .near(@location, @miles)


    @skills = @skills.map { |name| Skill.find_by_name(name) }
    @styles = @styles.map { |name| Style.find_by_name(name) }
  end
end
