class MenuController < ApplicationController
  before_filter :authenticate_user!#, :except => [:show, :index]


  def menu_user
  	@user= User.where(:email => current_user.email)

  end

  def menu_admin
  	#@user= User.where(:email => current_user.email)
  end
end
