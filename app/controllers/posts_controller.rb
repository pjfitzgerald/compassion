class PostsController < ApplicationController
  before_action :set_user
  before_action :set_questions
  
  def new
    @post = Post.new(journal_id: params[:journal_id])
    @journal = Journal.find(params[:journal_id])
  end

  def create
    @post = Post.new(post_params)
    @journal = Journal.find(params[:journal_id])
    if @post.save
      redirect_to journal_post_path # (/post/show path)
    else
      render :new
    end
  end

  private

  def set_user
    @user = current_user
  end

  def post_params
    params.require(:post).permit(:content)
  end
end
