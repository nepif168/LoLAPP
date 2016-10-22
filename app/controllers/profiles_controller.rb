class ProfilesController < ApplicationController
  def new
    #すでに作ってある場合はcreateで回避
    @profile = Profile.new
  end

  def edit
    @user = User.find(params[:user_id])
    #他人のを編集しようとした場合に回避
    unless @user==current_user
      redirect_to user_path(current_user)
    end
    @profile = current_user.profile
  end

  def create
    #すでに存在しているのに作ろうとした場合は作らない
    unless current_user.profile.nil?
      redirect_to user_path(current_user)
    end

    @profile = Profile.create(profile_params)
    current_user.profile = @profile
    redirect_to user_path(current_user)
  end

  def update
    @user = User.find(params[:user_id])
    #他人のを編集しようとした場合に回避
    unless @user==current_user
      redirect_to user_path(current_user)
    end

    @profile = current_user.profile
    @profile.update(profile_params)
    redirect_to user_path(current_user)
  end

  def champion_select
    @profile = current_user.profile
  end

  def update_champion
    @champions = champions_params
    @user = User.find(params[:user_id])
    logger.debug @champions
    if @champions["champions"].length>3 || @user!=current_user
      redirect_to user_path(current_user)
    else
      @profile = current_user.profile
      arr = Array.new(3)
      i = 0
      @champions["champions"].each do |key|
        arr[i]=key
        i+=1
      end
      @profile.update(champion1: arr[0], champion2: arr[1], champion3: arr[2])
      redirect_to user_path(current_user)
    end
  end

  private
    def profile_params
      params.require(:profile).permit(:summoner_name, :birthday, :content, :champion1, :champion2, :champion3, :twitter_url, :facebook_url)
    end

    def champions_params
      params.require(:update_form).permit(champions: [])
    end
end
