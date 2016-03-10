class ItemsController < ApplicationController


  def new
    @list = List.find(params[:list_id])
    @item = Item.new
  end

  def create
    @list = List.find(params[:list_id])
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
    @item.destroy
    redirect_to list_path(@list)
  end 


private 
  def item_params
    params.require(:item).permit(:name, :completed, :goal_dates)
  end 

 

end
