class DiariesController < ApplicationController
  before_action :logged_in_user, only: [:create]

  def create
    @diary = current_user.diaries.build(diary_params)
    if @diary.save
      flash[:success] = "Diary created!"
      redirect_to root_url
    else
      @feed_items = current_user.feed_items.includes(:user).order(created_at: :desc)
      render 'static_pages/home'
    end
  end
  
  def destroy
    @diary = current_user.diaries.find_by(id: params[:id])
    return redirect_to root_url if @diary.nil?
    @diary.destroy
    flash[:success] = "Diary deleted"
    redirect_to request.referrer || root_url
  end
  
  private
  def diary_params
    params.require(:diary).permit(:content,:title)
  end
end
