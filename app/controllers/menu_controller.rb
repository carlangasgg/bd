class MenuController < ApplicationController
  before_filter :authenticate_user!#, :except => [:show, :index]


  def menu_user
  	@user= User.where(:email => current_user.email)
  	@recursos = User.find(current_user.id).recursos
  	@tropas = User.find(current_user.id).tropas
  	#@prueba = Recurso.find(1)
  	#@resultado = RecursoUser.where(:recursos_id => @prueba.id, :user.id => @user.id)

  end

  def menu_admin
  	#@user= User.where(:email => current_user.email)
  end
end
