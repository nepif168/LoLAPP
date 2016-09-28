class ItemsetsController < ApplicationController

  def index
    @itemsets = Itemset.where(private: false)
    @user = current_user
  end

  def new
    @itemset = Itemset.new
  end

  def create
    @itemset = current_user.itemsets.build(itemset_params)
    @itemset.save
    redirect_to itemset_path(@itemset)
  end

  def destroy
    @itemset = Itemset.find(params[:id])
    @itemset.destroy
    redirect_to itemsets_path
  end

  def show
    @user = current_user
    @itemset = Itemset.find(params[:id])
    if @itemset.private && current_user.id!=@itemset.user_id
      redirect_to itemsets_path
    end
  end

  private
    def itemset_params
      params.require(:itemset).permit(:title, :title, :champion, :item0_id, :item1_id, :item2_id, :item3_id, :item4_id, :item5_id, :private)
    end
end
