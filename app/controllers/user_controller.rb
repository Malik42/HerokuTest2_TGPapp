class UserController < ApplicationController
  def show
    @userall = User.all
  end

  def new

  end

  def create
    c = City.create(name:"UNKNOWN", zip_code: "XXXXX")
    @user = User.create
    @user.first_name = params["first_name"]
    @user.last_name = params["last_name"]
    @user.email = params["email"]
    @user.description = params["description"]
    @user.password = params["password"]
    @user.city = c

    @user.save

    if @user.save
      flash[:success] = "Profil bien créé !"
      redirect_to '/static_pages/home'
      puts "INSCRIPTION RÉUSSIE"
    else
      flash.now[:danger] = 'Problème lors de ton inscription'
      puts "PROBLEME INSCRIPTION"
      render :new
    end
  end

end
