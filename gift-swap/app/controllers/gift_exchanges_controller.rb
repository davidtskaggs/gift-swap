class GiftExchangesController < ApplicationController
  before_action :set_gift_exchange, only: [:show, :edit, :update, :destroy]

  # GET /gift_exchanges
  # GET /gift_exchanges.json
  def index
    @gift_exchanges = GiftExchange.all
  end

  # GET /gift_exchanges/1
  # GET /gift_exchanges/1.json
  def show
  end

  # GET /gift_exchanges/new
  def new
    @gift_exchange = GiftExchange.new
  end

  # GET /gift_exchanges/1/edit
  def edit
  end

  # POST /gift_exchanges
  # POST /gift_exchanges.json
  def create
    @gift_exchange = GiftExchange.new(gift_exchange_params)

    respond_to do |format|
      if @gift_exchange.save
        format.html { redirect_to @gift_exchange, notice: 'Gift exchange was successfully created.' }
        format.json { render :show, status: :created, location: @gift_exchange }
      else
        format.html { render :new }
        format.json { render json: @gift_exchange.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /gift_exchanges/1
  # PATCH/PUT /gift_exchanges/1.json
  def update
    respond_to do |format|
      if @gift_exchange.update(gift_exchange_params)
        format.html { redirect_to @gift_exchange, notice: 'Gift exchange was successfully updated.' }
        format.json { render :show, status: :ok, location: @gift_exchange }
      else
        format.html { render :edit }
        format.json { render json: @gift_exchange.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /gift_exchanges/1
  # DELETE /gift_exchanges/1.json
  def destroy
    @gift_exchange.destroy
    respond_to do |format|
      format.html { redirect_to gift_exchanges_url, notice: 'Gift exchange was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_gift_exchange
      @gift_exchange = GiftExchange.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def gift_exchange_params
      params.require(:gift_exchange).permit(:recipient_id, :sender_id, :event_id, :wishlist_item_id)
    end
end
