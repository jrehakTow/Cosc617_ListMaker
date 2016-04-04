class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]

  # GET /items
  # GET /items.json

  def index
    @items = Item.all
  end

  # GET /items/1
  # GET /items/1.json
  def show
    @listId
  end


  # GET /items/new
  def new
    @item = Item.new
    @list = List.find(params[:list_id]) #this works

    @@listId = params[:list_id] #set parameter to variable

    @item.list_id = params[:list_id] #remove?

  end

  # GET /items/1/edit
  def edit
    @list = List.find(@item.list_id) #this!!

  end

  # POST /items
  # POST /items.json
  def create
    @item = Item.new(item_params)
    @item.list_id = @@listId #get list id from copied parameter

    respond_to do |format|
      if @item.save
        format.html { redirect_to List.find(@item.list_id), notice: 'Item was successfully created.' }
        format.json { render :show, status: :created, location: @item }
      else
        format.html { render :new }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /items/1
  # PATCH/PUT /items/1.json
  def update
    respond_to do |format|
      if @item.update(params.require(:item).permit(:name, :quantity))
        format.html { redirect_to List.find(@item.list_id), notice: 'Item was successfully updated.' }
        format.json { render :show, status: :ok, location: @item }
      else
        format.html { render :edit }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /items/1
  # DELETE /items/1.json
  def destroy
    @item.destroy
    respond_to do |format|
      format.html { redirect_to :back, notice: 'Item was successfully deleted.' } #not good for individual edit
      format.json { head :no_content }
    end

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item
      @item = Item.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def item_params
      #params.require(:item).permit(:name, :quantity, :list_id)
      params.require(:item).permit(:name, :quantity)
    end
end
