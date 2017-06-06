class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    pick = @user.picks.map{|i| i[:user_id] == params[:id]}
    @articles = Article.where{:id.in?(pick)}
  end
end
