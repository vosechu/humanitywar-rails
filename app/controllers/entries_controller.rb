class EntriesController < ApplicationController
  # GET /entries
  # GET /entries.json
  def index
    if params[:easy_mode] == 'true'
      @entries = Entry.easy_game
    else
      @entries = Entry.game
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @entries }
    end
  end

  # GET /entries/1
  # GET /entries/1.json
  def show
    @entry = Entry.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @entry }
    end
  end

  # PUT /entries/win
  def win
    Entry.find(params[:win_id]).increment!(:wins)
    Entry.find(params[:lose_id]).increment!(:loses)
    respond_to do |format|
      format.json { head :ok }
    end
  end
end
