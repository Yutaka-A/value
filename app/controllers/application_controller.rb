class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :set_current_user
  
  
  def set_current_user
     @current_user = User.find_by(id: session[:user_id]) 
  end
  
  def authentucate_user
    if @current_user == nil
      flash[:notice] = "ログインが必要です"
      redirect_to("/login")
    end
  end
  
  def forbid_login_user
    if @current_user
      flash[:notice] = "すでにログインしています"
      redirect_to("/posts/index")
    end
  end
  
  def user_level
    @posts = Post.all.order(created_at: :desc)
    # @user_level = Level.find_by()
  end
  

  
end
