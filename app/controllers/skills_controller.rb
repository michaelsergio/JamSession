class SkillsController < ApplicationController
  def new
    @skill = Skill.new
  end

  def create
    @skill = Skill.new(params[:skill])
    if @skill.save
      redirect_to @skill, notice: "Skill was created successfully."
    else 
      render action: "new"
    end
  end

  def edit
    @skill = Skill.find(params[:id])
  end

  def update
    @skill = Skill.find(params[:id])
    @skill.update_attributes(params[:skill])
  end

  def show
    @skill = Skill.find(params[:id])
  end

  def index
    @skills = Skill.all
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @skills }
    end
  end
end
