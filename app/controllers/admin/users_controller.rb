class Admin::UsersController < Admin::BaseController
  before_filter :find_user, :except => [ :index, :new, :create]

  def index
    @users = User.all(:order => "email")
  end
  
  def new
    @user = User.new
  end

  def create
    @user = User.new(:email => params[:user][:email], :password => params[:user][:password])
    set_admin
    if @user.save
      if params[:user][:admin] == "1"
        flash[:notice] = "Admin has been created"
      else
        flash[:notice] = "User has been created"
      end
      redirect_to admin_users_path
    else
      flash[:alert] = "User has not been created"
      render 'new'
    end
  end

  def show
    #taken care of before filter
  end

  def edit
    #taken care of before filter
  end

  def update
    set_admin
    if params[:user][:password].blank?
      params[:user].delete(:password)
    end
    if @user.update_attributes(:email => params[:user][:email], :password => params[:user][:password])
      if params[:user][:admin] == "1"
        flash[:notice] = "Admin has been updated"
      else
        flash[:notice] = "User has been updated"
      end
      redirect_to admin_users_path
    else
      flash[:alert] = "User has not been updated"
      render 'new'
    end
  end

  def destroy
  end

  private
    def find_user
      @user = User.find(params[:id])
    end
    
    def set_admin
      @user.admin = params[:user][:admin] == "1"
    end
end

