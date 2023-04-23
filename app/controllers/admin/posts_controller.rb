class Admin::PostsController < ApplicationController
  
  def index
     @posts = Post.where(status: :published).order(params[:sort]).page(params[:page]).per(10)
  end

  def show
    @post = Post.find(params[:id])
    @comments = @post.comments
    @post_tags = @post.tags
  end
  
  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    flash[:notice] = "投稿を削除しました。"
    redirect_to admin_posts_path
  end
  
  private

  def post_params
    params.require(:post).permit(:image,:title,:body,:region_id, :prefecture)
  end
  
end
