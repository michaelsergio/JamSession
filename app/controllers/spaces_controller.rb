class SpacesController < ApplicationController
  before_filter :authenticate_user!, except: [:show, :search]
  # GET /spaces
  # GET /spaces.json
  def index
    @spaces = Space.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @spaces }
    end
  end

  # GET /spaces/1
  # GET /spaces/1.json
  def show
    @space = Space.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @space }
    end
  end

  # GET /spaces/new
  # GET /spaces/new.json
  def new
    @space = Space.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @space }
    end
  end

  # GET /spaces/1/edit
  def edit
    @space = Space.find(params[:id])
    if current_user != @space.owner
      render :file => "public/422.html", status:422 and return
    end
  end

  # POST /spaces
  # POST /spaces.json
  def create
    @space = Space.new(params[:space])
    @space.owner = current_user

    respond_to do |format|
      if @space.save
        format.html { redirect_to @space, notice: 'Space was successfully created.' }
        format.json { render json: @space, status: :created, location: @space }
      else
        format.html { render action: "new" }
        format.json { render json: @space.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /spaces/1
  # PUT /spaces/1.json
  def update
    @space = Space.find(params[:id])
    
    if current_user != @space.owner
      render :file => "public/422.html", status:422 and return
    end

    respond_to do |format|
      if @space.update_attributes(params[:space])
        format.html { redirect_to @space, notice: 'Space was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @space.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /spaces/1
  # DELETE /spaces/1.json
  def destroy
    @space = Space.find(params[:id])

    if current_user != @space.owner
      render :file => "public/422.html", status:422 and return
    end

    @space.destroy

    respond_to do |format|
      format.html { redirect_to spaces_url }
      format.json { head :no_content }
    end
  end

  def search 
    #currently ignore location
    @space = Space.by_max_price(params[price_limit]).
                  by_services(params[services]).
                  by_min_people(params[min_people]).
                  all
  end

  def post_review
    @space = Space.find(params[:id])
    review = Review.new(params[:review])
    review.posted_by = current_user
    review.belongs_to(space)
    respond_to do |format|
      if review.save
        format.html { redirect_to @space, notice: 'Review was successfully created.' }
        format.json { render json: @space, status: :created, location: @space }
      else
        format.html { render action: "get" }
        format.json { render json: review.errors, status: :unprocessable_entity }
      end

  end

end
