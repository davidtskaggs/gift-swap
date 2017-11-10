class WishlistItemsController < ApplicationController
  before_action :set_wishlist_item, only: [:show, :edit, :update, :destroy]

  # GET /wishlist_items
  # GET /wishlist_items.json
  def index
    @wishlist_items = WishlistItem.all
  end

  # GET /wishlist_items/1
  # GET /wishlist_items/1.json
  def show
  end

  # GET /wishlist_items/new
  def new
    @wishlist_item = WishlistItem.new
  end

  # GET /wishlist_items/1/edit
  def edit
  end

  # POST /wishlist_items
  # POST /wishlist_items.json
  def create
    @wishlist_item = WishlistItem.new(wishlist_item_params)

    respond_to do |format|
      if @wishlist_item.save
        format.html { redirect_to @wishlist_item, notice: 'Wishlist item was successfully created.' }
        format.json { render :show, status: :created, location: @wishlist_item }
      else
        format.html { render :new }
        format.json { render json: @wishlist_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /wishlist_items/1
  # PATCH/PUT /wishlist_items/1.json
  def update
    respond_to do |format|
      if @wishlist_item.update(wishlist_item_params)
        format.html { redirect_to @wishlist_item, notice: 'Wishlist item was successfully updated.' }
        format.json { render :show, status: :ok, location: @wishlist_item }
      else
        format.html { render :edit }
        format.json { render json: @wishlist_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /wishlist_items/1
  # DELETE /wishlist_items/1.json
  def destroy
    @wishlist_item.destroy
    respond_to do |format|
      format.html { redirect_to wishlist_items_url, notice: 'Wishlist item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_wishlist_item
      @wishlist_item = WishlistItem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def wishlist_item_params
      params.require(:wishlist_item).permit(:wishlist_id, :gift_id)
    end
end
