class Public::FavoritesController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    Favorite.create(user_id: current_user.id, post: @post)
    
    render 'favorite.js.erb' 
  end

  def destroy
    @post = Post.find(params[:post_id])
    Favorite.find_by(user_id: current_user.id, post: @post).destroy
    
    render 'favorite.js.erb' 
  end
end
