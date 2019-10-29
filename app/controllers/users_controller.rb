class UsersController < ApplicationController
  # before_action :authenticate_user, {only: [:edit, :update]}
  before_action :forbid_login_user, {only: [:new, :create, :login_form, :login]}
  before_action :ensure_correct_user, {only: [:edit, :update, :show]}
  
  
  def ensure_correct_user
    @user = User.find_by(id: params[:id])
    if @user.id != @current_user.id
      flash[:notice] = "権限がありません"
      redirect_to("/posts/index")
    end
  end
  
  def signup
    @user = User.new
  end
  
  def show
    @user = User.find_by(id: params[:id])
  end
  
  def create
    # if params[:user_images] == nil
      @user = User.new(email: params[:email],
                      name: params[:name],
                      password: params[:password],
                      )
    # else
    #   @user = User.new(email: params[:email],
    #                   name: params[:name],
    #                   password: params[:passsword],
    #                   user_images: params[:id],
    #                   )
    #   image = params[:user_images]
    #   File.binwrite("public/user_images/#{@user.user_images}" , image.read)
    # # end
    if @user.save
      session[:user_id] = @user.id
      # @user = User.find_by(id: session[:id])
      @user.user_images = "#{@user.id}.jpg"
      @user.save
      flash[:notice] = "ユーザー登録完了！早速共有してみよう！"
      redirect_to("/posts/new")
    else
      render("users/signup")
    end
  end
  
  def login_form
  end
  
  def login
    @user = User.find_by(email: params[:email])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      flash[:notice] = "ログインしました"
      redirect_to("/posts/index")
    else
      @error_message = "メールアドレスもしくはパスワードが間違っています"
      @email = params[:email]
      @password = params[:password]
      render("users/login_form")
    end
  end
  
  def logout
    session[:user_id] = nil
    flash[:notice] = "ログアウトしました"
    redirect_to("/login")
  end
  
  def show
    @user = User.find_by(id: params[:id])
  end
  
  def edit
    @user = User.find_by(id: params[:id])
  end
  
  def update
    @user = User.find_by(id: params[:id])
    @user.name = params[:name]
    @user.email = params[:email]
    @user.password = params[:password]
    if params[:user_images]
      @user.user_images = "#{@user.id}.jpg"
      image = params[:user_images]
      File.binwrite("public/user_images/#{@user.user_images}" , image.read)
    end
    if @user.save
      flash[:notice] = "ユーザー情報を変更しました"
      redirect_to("/users/#{@user.id}")
    else
      render("users/edit")
    end

  end
  
end
