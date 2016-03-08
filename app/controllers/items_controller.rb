class ItemsController < ApplicationController

  before_action :item, except: [:new]

  def new
    @item = Item.new
  end

  def create
    @item = @list.create_item(item_params)
    redirect_to list_path(@list)
  end

  def edit
  end 

  def update
    @list = current_user.list.find(params[:list_id])
    @item = @list.item.find(params[:id])
    if @item.update
      redirect_to lists_path(current_user)
    else
      render :edit
    end
  end

  def destroy
    @item.destroy
    redirect_to lists_path(current_user)
  end 


private 
  def item_params
    params.require(:item).permit(:name, :completed, :goal_dates)
  end 

  def item
      @item = @list.item 
    end 

end
