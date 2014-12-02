class PurchasesController < ApplicationController
  before_action :set_purchase, only: :show

  # GET /purchases
  # GET /purchases.json
  def index
    @purchases = Purchase.all.includes(:products)
  end

  # GET /purchases/1
  # GET /purchases/1.json
  def show
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_purchase
      @purchase = Purchase.find(params[:id])
    end
end
