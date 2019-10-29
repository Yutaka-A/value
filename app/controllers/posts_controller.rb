class PostsController < ApplicationController
  before_action :ensure_correct_user, {only: [:edit, :update, :destroy]}
  
  
  def index
    @posts = Post.all.order(created_at: :desc)

  end
  
  def new
    if @current_user == nil
      flash[:notice] = "ログインが必要です"
      redirect_to("/login")
    end
    @post = Post.new
  end
  
  def create
    @post = Post.new(title: params[:title],
                     genre: params[:genre],
                     content: params[:content],
                     value: params[:value],
                     act: params[:act],
                     forWho: params[:forWho],
                     user_id: @current_user.id,
                     )
    if @post.save
      flash[:notice] = "価値観を共有しました"
      redirect_to("/posts/index")
    else
      render("posts/new")
    end
  end
  
  def show
    if @current_user != nil
      @post = Post.find_by(id: params[:id])
      @user = User.find_by(id: @post.user_id)
      @installs_count = Install.where(post_id: @post.id).count
    else
      flash[:notice] = "ログインが必要です"
      redirect_to("/login")
    end
  end
  
  def edit
    @post = Post.find_by(id: params[:id])
    @user = User.find_by(id: @post.user_id)
  end
  
  def update
    @post = Post.find_by(id: params[:id])
    @post.title = params[:title]
    @post.genre = params[:genre]
    @post.content = params[:content]
    @post.value = params[:value]
    @post.act = params[:act]
    @post.forWho = params[:forWho]
    if @post.save
      flash[:notice] = "価値観を更新しました"
      redirect_to("/posts/index")
    else
      render("posts/edit")
    end
  end
  
  def destroy
    @post = Post.find_by(id: params[:id])
    @post.destroy
    flash[:notice] = "投稿を削除しました"
    redirect_to("/posts/index")
    
  end
  
  def ensure_correct_user
    @post = Post.find_by(id: params[:id])
    if @post.user_id != @current_user.id
      flash[:notice] = "権限がありません"
      redirect_to("/posts/index")
    end
  end

end
