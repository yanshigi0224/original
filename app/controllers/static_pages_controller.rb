class StaticPagesController < ApplicationController
  def home
    @diary = current_user.diaries.build if logged_in?
  end
end
