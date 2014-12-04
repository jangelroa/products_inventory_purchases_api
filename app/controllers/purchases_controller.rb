class PurchasesController < ApplicationController
  before_action :set_purchase, only: [:show, :update, :destroy]

  before_action :authenticate, only: [:create, :update, :destroy]
  # GET /purchases
  # GET /purchases.json
  def index
    @purchases = Purchase.all.includes(:products)
  end

  # GET /purchases/1
  # GET /purchases/1.json
  def show
  end



  # POST /purchases
  # POST /purchases.json
  def create
    @purchase = Purchase.new(purchase_params)

    respond_to do |format|
      if @purchase.save
        format.json { render action: 'show', status: :created, location: @purchase }
      else
        format.json { render json: @purchase.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /purchases/1
  # PATCH/PUT /purchases/1.json
  def update
    respond_to do |format|
      if @purchase.update(purchase_params)
        format.json { head :no_content }
      else
        format.json { render json: @purchase.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /purchases/1
  # DELETE /purchases/1.json
  def destroy
    @purchase.destroy
    respond_to do |format|
      format.json { head :no_content }
    end
  end

  protected
  def authenticate
    authenticate_or_request_with_http_token do |token, options|
      User.find_by(auth_token: token)
    end
  end

  def authenticate
    authenticate_token || render_unauthorized
  end

  def authenticate_token
    authenticate_with_http_token do |token, options|
      User.find_by(auth_token: token)
    end
  end

  def render_unauthorized
    self.headers['WWW-Authenticate'] = 'Token realm="Episodes"'
    respond_to do |format|
      format.json { render json: 'Bad credentials', status: 401 }
      # format.xml { render xml: 'Bad credentials', status: 401 }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_purchase
      @purchase = Purchase.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def purchase_params
      params.require(:purchase).permit(:amount)
    end
end
