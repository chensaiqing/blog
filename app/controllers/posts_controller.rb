class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def index
    @post = Post.all
  end

  def create
    @post = Post.new(params[:post].permit(:title, :text))
    # @post = Post.new(post_params)
    
    if @post.save
      redirect_to @post
    else
      render 'new'
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  #private
  #def post_params
   # params.require(:post).permit(:title, :text)
  #end
end