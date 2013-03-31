class ReportsController < ApplicationController
  # GET /reports/gift_cards
  # GET /reports/gift_cards.json
  def gift_cards
    @report = GiftCard.report

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @report }
    end
  end
end
