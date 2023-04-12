class Admin::PostsController < ApplicationController
  
  def index
    @posts = Post.page(params[:page])
    @regions = Region.all
  end

  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
  end

  def edit
    @post = Post.find(params[:id])
  end
  
  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
     flash[:notice] = "変更を保存しました。"
     redirect_to post_path(@post)
    else
     render :edit
    end 
  end
  
  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    flash[:notice] = "投稿を削除しました。"
    redirect_to posts_path
  end
  
  private

  def post_params
    params.require(:post).permit(:image,:title,:body,:region_id)
  end
  
end
