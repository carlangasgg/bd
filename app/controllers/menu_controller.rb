class MenuController < ApplicationController
  before_filter :authenticate_user!#, :except => [:show, :index]


  def menu_user
  	@user= User.where(:email => current_user.email)
  	@recursos = User.find(current_user.id).recursos
  	@tropas = User.find(current_user.id).tropas
    @attack = User.find(current_user.id).tropas.sum(:ataque)
    @defense = User.find(current_user.id).tropas.sum(:defensa)


  end

  def menu_admin
  	
  end

  def tropas
    @tropa = Tropa.all
    
  end

  def agregar_tropa
    
    #nom_tropa = params[:id_tropa]
    #render :text =>@nom_tropa

    @trop = Tropa.find(params[:id_tropa]) 
    @usuario = User.find(current_user.id)
    @usuario.tropas << @trop
    
    redirect_to "/menu/menu_user"
    #redirect_to menu_user_menu_path
    
  end

  def quitar_tropa
    
  end

  def recursos
    @recursos = Recurso.all
    
  end

  def asignar_recurso

    
  end
end
#@team.players << Player.find(p)