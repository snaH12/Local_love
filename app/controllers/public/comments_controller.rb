class Public::CommentsController < ApplicationController
    def create
      @post = Post.find(params[:post_id])
      @comment = current_user.comments.new(comment_params)
      @comment.post_id = @post.id
      @comment.save
      render :comment
    end
    
    def destroy
    @comment = Comment.find_by(id: params[:id], post_id: params[:post_id])
    @comment.destroy
    
    end

    private
    
    def comment_params
        params.require(:comment).permit(:comment)
    end
end
