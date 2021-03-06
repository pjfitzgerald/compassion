class PostsController < ApplicationController
  before_action :set_user
  before_action :set_questions, :set_journal

  def index
    @posts = Post.where(journal: @journal)
    @post = Post.new
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    if params[:post][:title].empty?
      flash[:notice] = "Woops! Please add a title!"
    elsif params[:post][:content].empty?
      flash[:notice] = "Woops! Please add some text to your journal entry!"
    else
      @post = Post.new(title: params[:post][:title], content: params[:post][:content], journal: current_user.journal)
      if @post.save
        flash[:notice] = "Journal entry created!"
      else
        flash[:notice] = "Something went wrong!"
      end
    end
    redirect_back(fallback_location: root_path)
  end

  def update
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    flash[:notice] = "Deleted your post!"
    redirect_back(fallback_location: root_path)
  end

  private

  def set_user
    @user = current_user
  end

  def set_journal
    @journal = current_user.journal
  end

  def post_params
    params.require(:post).permit(:content, :title)
  end
end
