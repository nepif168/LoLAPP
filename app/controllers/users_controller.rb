class UsersController < ApplicationController

  def index
  end

  def favorites
    @user = current_user
  end

  def itemsetLists
    @itemsets = current_user.itemsets.all
    @user = current_user
  end

end
