class GiftsController < ApplicationController
  before_action :set_gift, only: [:show, :edit, :update, :destroy]

  # GET /gifts
  # GET /gifts.json
  def index
    @gifts = Gift.all
  end

  # GET /gifts/1
  # GET /gifts/1.json
  def show
  end

  # GET /gifts/new
  def new
    @gift = Gift.new
  end

  # GET /gifts/1/edit
  def edit
  end

  # POST /gifts
  # POST /gifts.json
   def create
    p '*'*10
    # p params
    # binding.pry
    p params["gift"]["keyword"]
    # p gift_params
    p @results = Wishlist.new.parsed_info_by_keyword(params["gift"]["keyword"])
    #@results = Wishlist.new.parsed_info_by_keyword(params[:gift][:category])
    # submit the form

    # go to the page with the list of results of the search

    # select one link, save the url into the database

    # Gift.new(name: gift_params, price: 19.99, url: "www.example.com", category: "kitchen")

    #@gift = Gift.new(name: gift_params["name"], price: 19.99, url: "www.example.com", category: gift_params["name"])

     respond_to do |format|
       #if @gift.save
        format.js
        # format.html { redirect_to @gift, notice: 'Gift was successfully created.' }
        # format.json { render :show, status: :created, location: @gift }
       #else
         # format.html { render :new }
         # format.json { render json: @gift.errors, status: :unprocessable_entity }
       #end
     end
   end

  # PATCH/PUT /gifts/1
  # PATCH/PUT /gifts/1.json
  def update
    respond_to do |format|
      if @gift.update(gift_params)
        format.html { redirect_to @gift, notice: 'Gift was successfully updated.' }
        format.json { render :show, status: :ok, location: @gift }
      else
        format.html { render :edit }
        format.json { render json: @gift.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /gifts/1
  # DELETE /gifts/1.json
  def destroy
    @gift.destroy
    respond_to do |format|
      format.html { redirect_to gifts_url, notice: 'Gift was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_gift
      @gift = Gift.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def gift_params
      params.require(:gift).permit(:name, :price, :url, :category)
    end
end
