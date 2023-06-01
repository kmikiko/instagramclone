class PostsController < ApplicationController
  before_action :set_post, only: [:show, :update, :edit, :destroy]
  before_action :limitation, only: [:update, :edit, :destroy]
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
    @post = current_user.posts.build(posts_params)
    if @post.save
      redirect_to posts_path, notice:"投稿しました！"
    else
      render :new
    end
  end

  def confirm
    @post = current_user.posts.build(posts_params)
    render :new if @post.invalid?
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
  end

  def update
    if @post.update(posts_params) 
      redirect_to posts_path, notice: "編集しました！"
    else
      render :edit
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_path, notice:"削除しました"
  end

  private

  def posts_params
    params.require(:post).permit(:content, :image, :image_cache)
  end

  def set_post
    @post = Post.find(params[:id])
  end

  def limitation
    if current_user.id != @post.id
      redirect_to posts_path
    end
  end

end
