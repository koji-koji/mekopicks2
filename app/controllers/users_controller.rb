class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @articles = Article.find(@user.picks.pluck(:article_id))
  end
end
