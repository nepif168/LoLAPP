class ItemsetsController < ApplicationController

  def index
    @itemsets = Itemset.where(private: false)
  end

  def new
    @itemset = Itemset.new

    @champion = params[:champion]
    @item0_id = params[:item0_id]
    @item1_id = params[:item1_id]
    @item2_id = params[:item2_id]
    @item3_id = params[:item3_id]
    @item4_id = params[:item4_id]
    @item5_id = params[:item5_id]
  end

  def create
    @itemset = current_user.itemsets.build(itemset_params)
    @itemset.save
    redirect_to itemset_path(@itemset)
  end

  def edit
  end

  def destroy
    @itemset = Itemset.find(params[:id])
    @itemset.destroy
    redirect_to itemsets_path
  end

  def show
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
