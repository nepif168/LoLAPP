class UsersController < ApplicationController

  def index
    @itemsets = current_user.itemsets.all.order("updated_at DESC").first(5)
  end

  def show
    @user = User.find(params[:id])
    @profile = @user.profile
    @itemsets = current_user.itemsets.all.order("updated_at DESC").first(3)
  end

  def favorites
    @user = current_user
  end

  def itemsetLists
    @user = User.find(params[:id])
    @itemsets = current_user.itemsets.all.order("updated_at DESC")
  end

end
