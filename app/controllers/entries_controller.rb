class EntriesController < ApplicationController
  before_filter :find_small_entries

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
    # Store the last entries so we can display them below
    session[:last_win_id] = params[:win_id]
    session[:last_lose_id] = params[:lose_id]

    # Increment the win/lose counters
    Entry.find(params[:win_id]).increment!(:wins)
    Entry.find(params[:lose_id]).increment!(:loses)

    # Respond with an empty
    respond_to do |format|
      format.json { render json: {} }
    end
  end

  # PUT /entries/draw
  def draw
    Entry.find(params[:draw_ids][0]).increment!(:draws)
    Entry.find(params[:draw_ids][1]).increment!(:draws)
    respond_to do |format|
      format.json { render json: {} }
    end
  end

  #GET /entries/new
  def new
    @entry = Entry.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @entry }
    end
  end

  #POST /entries/create
  def create
    @entry = Entry.create(params[:entry].merge(:playa_id => 1))

    # Update the m2m table with the order of cards. These will already exist
    # but they'll have a default order of 0
    if @entry.errors.empty?
      @entry.order_white_cards(params[:entry][:white_card_ids])
    end

    respond_to do |format|
      if @entry.errors.empty?
        format.html { redirect_to @entry, notice: 'Entry was successfully created.' }
        format.json { render json: @entry, status: :created, location: @entry }
      else
        format.html { render action: "new" }
        format.json { render json: @entry.errors, status: :unprocessable_entity }
      end
    end
  end

# GET /entries/winning
  def winning
    @entries = Entry.winningest.paginate(:page => params[:page])

    respond_to do |format|
      format.html # winning.html.erb
      format.json { render json: @entries }
    end
  end

# GET /entries/losing
  def losing
    @entries = Entry.losingest.paginate(:page => params[:page])

    respond_to do |format|
      format.html # losing.html.erb
      format.json { render json: @entries }
    end
  end

# GET /entries/newest
  def newest
    @entries = Entry.newest.paginate(:page => params[:page])

    respond_to do |format|
      format.html # newest.html.erb
      format.json { render json: @entries }
    end
  end

  private

  def find_small_entries
    if session[:last_win_id]
      @small_entries = {
        :last_win_id => Entry.find(session[:last_win_id]),
        :last_lose_id => Entry.find(session[:last_lose_id])
      }
    end
  rescue
  end
end
