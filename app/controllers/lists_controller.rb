class ListsController < ApplicationController
  def index
    @lists = current_user.lists.all
  end

  def show
    @list = List.find(params[:id])
  end

  def edit
  end

  def update
    if @list.update(list_params)
      redirect_to user_lists_path(current_user, @list)
    else
      render :edit
    end
  end

  def new
    @list = List.new
  end

  def create
    @list = current_user.list.new(list_params)
    if @list.save
      redirect_to user_lists_path(current_user)
    else
      render :new
    end
  end

  def destroy
    @list.destroy
    redirect_to root
  end

  private
    def list_params
      params.require(:list).permit(:name, :date)
    end


    def list
      @list = current_user.lists.find(params[:id])
    end
end
