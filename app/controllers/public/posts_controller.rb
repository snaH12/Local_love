class Public::PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :is_matching_login_user, only: [:edit, :update, :destroy]
  
  def new
     @post = Post.new
  end
  
  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    #タグの配列を作成
    tag_list = params[:post][:name].split(',')
    if @post.save
      @post.save_tag(tag_list)
      redirect_to post_path(@post), notice: "投稿が完了しました。"
    else
      @post = Post.new
      @posts = Post.all
      render :index
    end
  end
  
  def index
    @posts = Post.where(status: :published).order(params[:sort]).page(params[:page]).per(12)
    @posts = @posts.where('location LIKE ?', "%#{params[:search]}%") if params[:search].present?
    @regions = Region.all
    @tag_list=Tag.all
  end
  
  
  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
    #その投稿に紐づくタグを表示
    @post_tags = @post.tags
  end
  
  
  def edit
    @post = Post.find(params[:id])
    @tag_list=@post.tags.pluck(:name).join(',')
  end
  
  
  def update
    @post = Post.find(params[:id])
    tag_list=params[:post][:name].split(',')
    if @post.update(post_params)
      if params[:post][:status]== "published"
        @old_relations=PostTag.where(post_id: @post.id)
        @old_relations.each do |relation|
        relation.delete
        end  
        @post.save_tag(tag_list)
       redirect_to post_path(@post), notice: "変更を保存しました。"
      else 
        redirect_to posts_path
      end
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
  
  
  def confirm
    @tag_list=Tag.all
    @posts = current_user.posts.draft.page(params[:page]).reverse_order
  end
  
  
  def search_tag
    @tag_list=Tag.all
    @tag=Tag.find(params[:tag_id])
    @posts=@tag.posts.page(params[:page]).per(10)
  end
  
  
  private

  def post_params
    params.require(:post).permit(:image,:title,:body,:region_id, :status)
  end
  
  def  is_matching_login_user
    @post = Post.find(params[:id])
   unless @post.user == current_user
     redirect_to posts_path
   end
  end
  
end
