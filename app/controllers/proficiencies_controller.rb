class ProficienciesController < ApplicationController
  # GET /proficiencies
  # GET /proficiencies.json
  def index
    @proficiencies = Proficiency.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @proficiencies }
    end
  end

  # GET /proficiencies/1
  # GET /proficiencies/1.json
  def show
    @proficiency = Proficiency.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @proficiency }
    end
  end

  # GET /proficiencies/new
  # GET /proficiencies/new.json
  def new
    @proficiency = Proficiency.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @proficiency }
    end
  end

  # GET /proficiencies/1/edit
  def edit
    @proficiency = Proficiency.find(params[:id])
  end

  # POST /proficiencies
  # POST /proficiencies.json
  def create
    @proficiency = Proficiency.new(params[:proficiency])

    respond_to do |format|
      if @proficiency.save
        format.html { redirect_to @proficiency, notice: 'Proficiency was successfully created.' }
        format.json { render json: @proficiency, status: :created, location: @proficiency }
      else
        format.html { render action: "new" }
        format.json { render json: @proficiency.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /proficiencies/1
  # PUT /proficiencies/1.json
  def update
    @proficiency = Proficiency.find(params[:id])

    respond_to do |format|
      if @proficiency.update_attributes(params[:proficiency])
        format.html { redirect_to @proficiency, notice: 'Proficiency was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @proficiency.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /proficiencies/1
  # DELETE /proficiencies/1.json
  def destroy
    @proficiency = Proficiency.find(params[:id])
    @proficiency.destroy

    respond_to do |format|
      format.html { redirect_to proficiencies_url }
      format.json { head :no_content }
    end
  end
end
