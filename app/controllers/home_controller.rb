class HomeController < ApplicationController
  
  def index
    @users = User.all
    @lists = current_user.lists.all
    @items = []
    if @lists.any?
      @lists.each do |list|
        list.items.each do |item|
          @items << item
        end
      end
    end
    @items = @items.sort_by(&:updated_at).reverse.take(5)
  end

  def show
  end

  def new

  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end


end
