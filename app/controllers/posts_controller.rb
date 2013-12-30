class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end
  
  def edit
    @post = Post.find(params[:id])
  end  

  def update
    @post = Post.find(params[:id])
    if @post.update(params[:post].permit(:title, :text))
      redirect_to @post
    else
      render 'edit'
    end
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
