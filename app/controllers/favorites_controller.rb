class FavoritesController < ApplicationController


  def create
    @itemset = Itemset.find(params[:itemset_id])
    @favorite = current_user.favorites.build(itemset: @itemset)
    if @favorite.save
      redirect_to itemset_path(@itemset)
    else
      redirect_to itemsets_path
    end
  end

  def destroy
    @favorite = current_user.favorites.find_by!(itemset_id: params[:itemset_id])
    @favorite.destroy
    redirect_to itemsets_path
  end

end
