class MenuController < ApplicationController
  before_filter :authenticate_user!

  def menu_user #Se muestran los datos y estadísticas del usuario, además de tropas y recursos asociados
  	@user= User.where(:email => current_user.email)
  	@recursos = User.find(current_user.id).recursos
  	@tropas = User.find(current_user.id).tropas
    @attack = User.find(current_user.id).tropas.sum(:ataque)
    @defense = User.find(current_user.id).tropas.sum(:defensa)


  end

  def menu_admin
  	
  end

  def tropas # Si hay una tropa asociada al usuario, no permite agregar otra tropa
    if current_user.tropas.exists?
      redirect_to "/menu/menu_user"
    else
      @tropa = Tropa.all
    end
    
  end

  def agregar_tropa# Acá se asocia la tropa al usuario, 
                    #si es q el usuario posee el recurso asociado a la tropa
    @trop = Tropa.find(params[:id_tropa])
    @usr = User.find(current_user.id)

    if (current_user.recursos.where(:nombre => @trop.recurso).exists?) 
          @usr.tropas << @trop
          current_user.recursos.delete(Recurso.where(:nombre => @trop.recurso))

          redirect_to "/menu/menu_user"

    else
      redirect_to "/menu/menu_user"
    end

  end


  def recursos #Si el usuario ya posee 2 recursos, se le prohibirá pedir más
    if current_user.recursos.count < 2
      @recursos = Recurso.all
    else
      redirect_to "/menu/menu_user"
    end
    
  end

  def agregar_recurso# Se hace la asociación del recurso al usuario
    @rec = Recurso.find(params[:id_recurso]) 
    #@usuario = User.find(current_user.id)
    current_user.recursos << @rec
    
    redirect_to "/menu/menu_user"
    
  end
end
