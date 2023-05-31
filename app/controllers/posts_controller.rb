class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def new
    if params[:back]
      @post = Post.new(posts_params)
    else
      @post = Post.new
    end 
  end

  def create
    @post = Post.new(posts_params)
    if @post.save
      redirect_to posts_path, notice:"投稿しました！"
    else
      render :new
    end
  end

  def confirm
    @post = Post.new(posts_params)
    render :new if @post.invalid?
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit

  end

  private

  def posts_params
    params.require(:post).permit(:content, :image, :image_cache)
  end

  
end
