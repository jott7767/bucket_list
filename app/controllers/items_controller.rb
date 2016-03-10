class ItemsController < ApplicationController
  before_action :list, only: [:new, :create, :destroy]

  def new
    @item = Item.new
  end

  def create
    @item = @list.items.create(item_params)
    redirect_to list_path(@list)
  end

  def edit
  end 

  def update
    @list = current_user.lists.find(params[:list_id])
    @item = @list.items.find(params[:id])
    if @item.update(item_params)
      redirect_to list_path(@list)
    else
      render :edit
    end
  end

  def destroy
    @item = @list.items.find(params[:id])
    @item.destroy
    redirect_to list_path(@list)
  end 


private 
  def item_params
    params.require(:item).permit(:name, :completed, :goal_dates)
  end 
  
  def list
    @list = List.find(params:list_id)
  end
 

end
