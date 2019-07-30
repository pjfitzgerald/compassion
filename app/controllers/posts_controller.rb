class PostsController < ApplicationController
  before_action :set_user
  before_action :set_questions, :set_journal, only: [:new, :create]

  def index
    @posts = Post.where(journal_id: Journal.where(user_id: User.find(current_user.id)))
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

  def post_params
    params.require(:post).permit(:content)
  end

  def journal_params
    params.require(:journal).permit(:journal_id)
  end

  def set_journal
    @journal = Journal.find(journal_params)
  end
end
