class PostsController < ApplicationController
  def index
    @posts = Post.all.order(created_at: :desc)
  end

  def show
    @post = Post.find_by(id: params[:id])
    
  end

  def new
    @post = Post.new 
  end

  def create
    @post = Post.new(
      content: params[:content],)
    if @post.save
      flash[:notice] = "手紙を置きました。置手紙置き場で確認！"
      redirect_to("/posts/index")
    else
      #render newアクションを経由せずビューを表示
      render("posts/new")
    end
  end

  def edit
    @post = Post.find_by(id:params[:id])
  end

  def update
    @post = Post.find_by(id:params[:id])
    @post.content = params[:content]
    if @post.save
      flash[:notice] = "置手紙を書き替えました！"
      redirect_to("/posts/index")
    else
      render("posts/edit")
    end
  end

  def destroy
    @post = Post.find_by(id:params[:id]) 
    @post.destroy
    flash[:notice] = "置手紙を捨てました。"
    redirect_to("/posts/index")
  end

end
