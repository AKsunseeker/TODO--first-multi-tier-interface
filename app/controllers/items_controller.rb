class ItemsController < ApplicationController

  def show
    @item = Item.find(params[:id])
  end

  def new
    @item = Item.new
    @item = Item.new(list_id: params[:list_id])
  end
   
  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to list_path(@item.list_id)
    else
       render :new
    end 
  end 

  def edit
    # GET
    # rendering a form so we can edit a single item
    @item = Item.find(params[:id])
  end

  def update
    # PUT
    # updating the item and redirecting the user
    @item = Item.find(params[:id])
    if @item = Item.update(item_params)
      redirect_to item_path(@item)
    else
      render :edit
    end
    
  end

  def destroy
    # DELETE
    # finding the item and removing it from the database
    @item = Item.find(params[:id])
    if item.destroy
      redirect_to list_path
    else
      redirect_to item_path(item)
    end
    
  end

  private
    def item_params
      params.require(:item).permit(:name, :description, :priority, :completed, :list_id)
    end

end
