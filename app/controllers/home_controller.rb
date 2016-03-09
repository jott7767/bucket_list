class HomeController < ApplicationController
  def index
    @users = User.all
    @lists = current_user.lists.all
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
