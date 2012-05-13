class StylesController < ApplicationController

  def new
    @style = Style.new
  end

  def create
    @style = Style.new(params[:style])
    if @style.save
      redirect_to @style, notice: "Style was created successfully."
    else 
      render action: "new"
    end
  end

  def edit
    @style = Style.find(params[:id])
  end

  def update
    @style = Style.find(params[:id])
    @style.update_attributes(params[:style])
  end

  def show
    @style = Style.find(params[:id])
  end

  def index
    @styles = Style.all
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @styles }
    end
  end
end
