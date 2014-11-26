class CombateController < ApplicationController
before_filter :authenticate_user!
	

	def preparados #controlador que muestra datos del usuario y del rival
		coincidencias = User.last
		@random = rand(coincidencias.id) + 1
		if User.exists?(@random)
			@rival = User.where(:id => @random, :permiso => "usuario")
			@enemigo = User.find(@random)
			@ataque_usuario = current_user.tropas.sum(:ataque)
			@ataque_rival = @enemigo.tropas.sum(:ataque)
			@defensa_usuario = current_user.tropas.sum(:defensa)
			@defensa_rival = @enemigo.tropas.sum(:defensa)

		else
			redirect_to "/combate/preparados"
		end

	
	end

	def iniciar_combate #Método que hace el algoritmo de lucha. Es el corazón del juego :)
		
		usuario = User.find(current_user.id)
		rival = User.find(params[:id_rival])
		
		ataque_usuario = usuario.tropas.sum(:ataque)
		defensa_enemigo = rival.tropas.sum(:defensa)
		
		if ataque_usuario > defensa_enemigo
			rival.recursos.delete(Recurso.all)
			rival.tropas.delete(Tropa.all)

			x = current_user
			x.puntos_experiencia = x.puntos_experiencia + 10
			x.partidas_ganadas = x.partidas_ganadas + 1
			x.save

			redirect_to "/combate/victoria"

		elsif ataque_usuario == defensa_enemigo
			redirect_to "/combate/empate"

		else
			usuario.recursos.delete(Recurso.all)
			usuario.tropas.delete(Tropa.all)

			x = current_user
			x.puntos_experiencia = x.puntos_experiencia - 5
			x.partidas_perdidas = x.partidas_perdidas + 1
			x.save			

			redirect_to "/combate/derrota"
			
		end	
	end

	def rendicion #Si el usuario no quiere pelear, pasa por este método al presionar el botón "rendirse"
		current_user.recursos.delete(Recurso.all)
		current_user.tropas.delete(Tropa.all)
		x = current_user
		x.puntos_experiencia = x.puntos_experiencia - 10
		x.save

		redirect_to "/menu/menu_user"
	end

	def victoria #Algoritmo para subir de nivel y guardar victoria y experiencia ganada
		vic = current_user.partidas_ganadas
		exp = current_user.puntos_experiencia
		x = current_user
		lvl = vic + (10 + exp)

		if lvl > 200 and x.nivel < 30
			x.nivel = x.nivel + 1
			x.puntos_experiencia = 0
			x.save
		end			
				
	end

	def derrota #A diferencia del metodo victoria, acá no ocurre nada. 
				#Todo lo relacionado a perder, está en el método iniciar_combate
	end

	def empate #Acá tampoco ocurre nada
		
	end

end


