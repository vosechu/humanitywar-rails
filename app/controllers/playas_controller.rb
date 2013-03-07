class PlayasController < ApplicationController
  # GET /playas
  # GET /playas.json
  def index
    @playas = Playa.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @playas }
    end
  end

  # GET /playas/1
  # GET /playas/1.json
  def show
    @playa = Playa.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @playa }
    end
  end

  # GET /playas/new
  # GET /playas/new.json
  def new
    @playa = Playa.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @playa }
    end
  end

  # GET /playas/1/edit
  def edit
    @playa = Playa.find(params[:id])
  end

  # POST /playas
  # POST /playas.json
  def create
    @playa = Playa.new(params[:playa])

    respond_to do |format|
      if @playa.save
        format.html { redirect_to @playa, notice: 'Playa was successfully created.' }
        format.json { render json: @playa, status: :created, location: @playa }
      else
        format.html { render action: "new" }
        format.json { render json: @playa.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /playas/1
  # PUT /playas/1.json
  def update
    @playa = Playa.find(params[:id])

    respond_to do |format|
      if @playa.update_attributes(params[:playa])
        format.html { redirect_to @playa, notice: 'Playa was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @playa.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /playas/1
  # DELETE /playas/1.json
  def destroy
    @playa = Playa.find(params[:id])
    @playa.destroy

    respond_to do |format|
      format.html { redirect_to playas_url }
      format.json { head :no_content }
    end
  end
end
