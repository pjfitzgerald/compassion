class PostsController < ApplicationController
  before_action :set_user
  before_action :set_questions, :set_journal

  def index
    @posts = Post.where(journal: @journal)
  end

  def show
    @post = Post.find(post_params)
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
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

  def set_journal
    @journal = current_user.journal
  end

  def post_params
    params.require(:post).permit(:id)
  end
end
