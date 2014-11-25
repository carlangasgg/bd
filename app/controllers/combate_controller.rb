class CombateController < ApplicationController
before_filter :authenticate_user!#, :except => [:show, :index]
	

	def preparados

		coincidencias = User.count
		@random = 6
		@rival = User.where(:id => @random, :permiso => "usuario")
		@enemigo = User.find(@random)

	
	end

	def iniciar_combate
		ataque_usuario = User.find(current_user.id).tropas.sum(:ataque)
		defensa_enemigo = User.find(params[:id_rival]).tropas.sum(:ataque)

		#render :text => defensa_enemigo
		if ataque_usuario > defensa_enemigo
			@ganador = User.find(current_user.id)
			redirect_to "/combate/victoria"

		elsif ataque_usuario == defensa_enemigo
			redirect_to "/combate/empate"
			
			@ganador = User.find(params[:id_rival])
			redirect_to "/combate/derrota"
			
		end	
	end

	def victoria
				
	end

	def derrota
		
	end

end


