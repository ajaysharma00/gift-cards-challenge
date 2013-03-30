class GiftCardsController < ApplicationController
  # GET /gift_cards
  # GET /gift_cards.json
  def index
    @gift_cards = GiftCard.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @gift_cards }
    end
  end

  # GET /gift_cards/1
  # GET /gift_cards/1.json
  def show
    @gift_card = GiftCard.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @gift_card }
    end
  end

  # GET /gift_cards/new
  # GET /gift_cards/new.json
  def new
    @gift_card = GiftCard.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @gift_card }
    end
  end

  # GET /gift_cards/1/edit
  def edit
    @gift_card = GiftCard.find(params[:id])
  end

  # POST /gift_cards
  # POST /gift_cards.json
  def create
    @gift_card = GiftCard.new(params[:gift_card])

    respond_to do |format|
      if @gift_card.save
        format.html { redirect_to @gift_card, notice: 'Gift card was successfully created.' }
        format.json { render json: @gift_card, status: :created, location: @gift_card }
      else
        format.html { render action: "new" }
        format.json { render json: @gift_card.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /gift_cards/1
  # PUT /gift_cards/1.json
  def update
    @gift_card = GiftCard.find(params[:id])

    respond_to do |format|
      if @gift_card.update_attributes(params[:gift_card])
        format.html { redirect_to @gift_card, notice: 'Gift card was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @gift_card.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /gift_cards/1
  # DELETE /gift_cards/1.json
  def destroy
    @gift_card = GiftCard.find(params[:id])
    @gift_card.destroy

    respond_to do |format|
      format.html { redirect_to gift_cards_url }
      format.json { head :no_content }
    end
  end
end
